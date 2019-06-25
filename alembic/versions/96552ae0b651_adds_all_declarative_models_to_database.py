"""adds all declarative models to database

Revision ID: 96552ae0b651
Revises: 
Create Date: 2018-05-14 10:31:00.834656

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision = '96552ae0b651'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('appliance_type',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('appliance_type_name', sa.TEXT(), nullable=True),
    sa.Column('aliases', postgresql.ARRAY(sa.TEXT()), nullable=True),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('appliance_type_name')
    )
    op.create_table('origin_dataset',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('dataset_name', sa.TEXT(), nullable=False),
    sa.Column('dataset_description', sa.TEXT(), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('physical_quantity',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('quantity_name', sa.TEXT(), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('power_source',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('description', sa.TEXT(), nullable=True),
    sa.Column('origin_dataset_id', sa.Integer(), nullable=True),
    sa.Column('power_source_type', sa.TEXT(), nullable=True),
    sa.ForeignKeyConstraint(['origin_dataset_id'], ['origin_dataset.id'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('id')
    )
    op.create_table('aggregate',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.ForeignKeyConstraint(['id'], ['power_source.id'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('id')
    )
    op.create_table('sample',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('power_source_id', sa.BigInteger(), nullable=True),
    sa.Column('measurement', postgresql.DOUBLE_PRECISION(), nullable=True),
    sa.Column('timestamp', postgresql.TIMESTAMP(), nullable=True),
    sa.Column('physical_quantity_id', sa.BigInteger(), nullable=True),
    sa.ForeignKeyConstraint(['physical_quantity_id'], ['physical_quantity.id'], ),
    sa.ForeignKeyConstraint(['power_source_id'], ['power_source.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('appliance',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('aggregate_id', sa.Integer(), nullable=True),
    sa.Column('appliance_type_id', sa.BigInteger(), nullable=True),
    sa.ForeignKeyConstraint(['aggregate_id'], ['aggregate.id'], ),
    sa.ForeignKeyConstraint(['appliance_type_id'], ['appliance_type.id'], ),
    sa.ForeignKeyConstraint(['id'], ['power_source.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('appliance')
    op.drop_table('sample')
    op.drop_table('aggregate')
    op.drop_table('power_source')
    op.drop_table('physical_quantity')
    op.drop_table('origin_dataset')
    op.drop_table('appliance_type')
    # ### end Alembic commands ###
