"""adds timestamp sync columns to greenant_meter

Revision ID: b60c981f8c80
Revises: ddd5ca630063
Create Date: 2018-10-15 17:32:05.962962

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'b60c981f8c80'
down_revision = 'ddd5ca630063'
branch_labels = None
depends_on = None


def upgrade():
    op.add_column('greenant_meter', sa.Column('last_sync_phase_A', sa.TIMESTAMP(), nullable=True))
    op.add_column('greenant_meter', sa.Column('last_sync_phase_B', sa.TIMESTAMP(), nullable=True))
    op.add_column('greenant_meter', sa.Column('last_sync_phase_C', sa.TIMESTAMP(), nullable=True))


def downgrade():
    op.drop_column('greenant_meter', 'last_sync_phase_A')
    op.drop_column('greenant_meter', 'last_sync_phase_B')
    op.drop_column('greenant_meter', 'last_sync_phase_C')

