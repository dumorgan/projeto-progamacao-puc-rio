from disaggregation import disaggregation_models
import tensorflow as tf
tf.enable_eager_execution()
import numpy as np

x = np.random.random_sample(32 * 1024 * 5).reshape(32, 1024, 5)
t = tf.convert_to_tensor(x)

out = tf.map_fn(lambda ti: disaggregation_models.classes_to_logits(ti), t)

for bi in zip(t, out):
    for vi in zip(bi[0], bi[1]):
        argmax = tf.argmax(vi[0])
        tf.assert_equal(x=tf.to_int64(tf.round(vi[1][: argmax+1])), y=tf.ones_like(tf.to_int64(vi[1][: argmax+1])),
                        message="Should be one on this vec: {} was {}".format(vi[0], vi[1]), summarize=5)
        tf.assert_equal(x=tf.to_int64(tf.round(vi[1][argmax+1:])), y=tf.zeros_like(tf.to_int64(vi[1][argmax+1:])),
                        message="Should be zero on this vec: {} was {}".format(vi[0], vi[1]), summarize=5)

