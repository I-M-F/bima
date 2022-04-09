from brownie import BimaToken, accounts,network, config;
from helpful_scripts import get_account, fund_with_link
from web3 import Web3;



def test_bimatoken_deploy():
    account = accounts[0]
    # address_to = accounts[1]
    bima = BimaToken.deploy(config["networks"][network.show_active()].get("verify"),{'from': accounts[0]})

def test_make_payment(address _to, address _from, amount=None):
    # account = get_account()
    # balance = accounts[0].balance()
    # tx2 = account.transferFrom(account, accounts[1], amount)
    # tx = account.transferFrom(accounts[1], amount, {"from": account})   
    # tx.wait(1)
    # tx.wait(1)
    # print("Transfer success!")
    # return tx,tx2

def main():
    test_bimatoken_deploy()
    test_make_payment()
