from disaggregation.disaggregation_models.auxiliary_nn.invertible_layers \
    import act_norm, affine_coupling_layer, invertible_1x1_convolution, flow_step

import tensorflow as tf
import numpy as np


num_steps = 8


def forward(x, training=False):
    """
    :param forward_input: appliance-level sequences (one appliance per channel) (x)
    :param training: whether to train or not the model
    :return: aggregate power consumption y,  latent variable z
    """
    yi = x
    logdet = 0
    for k in range(num_steps):
        yi, logdet = flow_step(yi, logdet,
                               name="flow_{}".format(k),
                               training=training)
    y = yi[:, :, :, 0]
    y = tf.expand_dims(y, -1)
    z = yi[:, :, :, 1:]
    # z = tf.reshape(z, shape=z.get_shape().as_list())
    return y, z, logdet


def backward(y, z, training=False):
    xi = tf.concat(values=[y, z], axis=-1)
    logdet = 0
    for k in reversed(range(num_steps)):
        xi, logdet = flow_step(xi, logdet,
                               name="flow_{}".format(k),
                               reverse=True,
                               training=training)
    return xi, logdet


if __name__ == '__main__':
    print("Testing invertibility property of NilmGlow")
    x = np.random.random_sample((64, 512, 1, 4))

    x_t = tf.convert_to_tensor(x)

    placeholder_y = tf.placeholder(tf.float64, (64, 512, 1, 1))
    placeholder_z = tf.placeholder(tf.float64, (64, 512, 1, 3))

    forward_op = forward(x_t)
    backward_op = backward(placeholder_y, placeholder_z)

    sess = tf.Session()
    sess.run(tf.global_variables_initializer())

    y_pred, z_pred, logdet = sess.run(forward_op)

    y = tf.convert_to_tensor(y_pred)
    z = tf.convert_to_tensor(z_pred)

    x_pred, nlogdet = sess.run(backward_op, feed_dict={placeholder_y: y_pred,
                                                       placeholder_z: z_pred})

    assert np.allclose(x, x_pred), "x is not the same as x_pred"
    print("Passed invertibility test")


