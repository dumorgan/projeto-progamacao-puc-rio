"""creates greenant_meter table

Revision ID: ddd5ca630063
Revises: e810bd8347c9
Create Date: 2018-10-05 14:26:26.370794

"""
from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision = 'ddd5ca630063'
down_revision = 'e810bd8347c9'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
        'greenant_meter',
        sa.Column('id', sa.BigInteger, primary_key=True, unique=True),
        sa.Column('receiver_uid', sa.TEXT, nullable=False),
        sa.Column('power_source_phase_A', sa.BigInteger),
        sa.Column('power_source_phase_B', sa.BigInteger),
        sa.Column('power_source_phase_C', sa.BigInteger),
        sa.PrimaryKeyConstraint('id'),
        sa.UniqueConstraint('receiver_uid')
    )


def downgrade():
    op.drop_table('greenant_meter')
