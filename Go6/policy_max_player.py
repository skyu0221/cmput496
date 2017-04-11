#!/usr/bin/python3

from board_util import GoBoardUtil
from gtp_connection import GtpConnection

class PolicyPlayer(object):
    """
        Plays according to the Go4 playout policy.
        No simulations, just random choice among current policy moves
    """

    version = 0.1
    name = "Policy Max Player"
    def __init__(self):
        pass

    def get_move(self, board, toplay):
        return GoBoardUtil.generate_max( \
                              GoBoardUtil.generate_prob_playout_moves( board ) )

    def policy(self,board,color):
        return self.get_move( board, color )

    def run(self, board, color, print_info=False):
        pass
    
    def reset(self):
        pass

    def update(self, move):
        pass

    def get_properties(self):
        return dict(
            version=self.version,
            name=self.__class__.__name__,
        )

def createPolicyPlayer():
    con = GtpConnection(PolicyPlayer())
    con.start_connection()

if __name__=='__main__':
    createPolicyPlayer()

