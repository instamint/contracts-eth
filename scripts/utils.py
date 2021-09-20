from brownie import accounts, MintTheGram
def test():
    print('it works!')

def all_balances():
    eth = 10 ** 18
    for a in accounts:
        print(a.address,':',a.balance() / eth,' eth')

def all_balances_erc20(token):
    for a in range(0,len(accounts)):
        print(a,accounts[a].address,token.balanceOf(accounts[a]))

def allowance_grid(token):
    for a in accounts:
        for b in accounts:
            print(a.address,b.address,token.allowance(a,b))

def all_balances_nft(token):
    for a in accounts:
        print(a,token.balanceOf(a))

def all_nfts(token):
    ts = token.totalSupply()
    for t in range(0,ts):
        print(t,'uri is',token.tokenURI(t),'owned by',token.ownerOf(t))

def all_mtg_nfts(token):
    print('insta urls')
    ts = token.totalSupply()
    for t in range(0,ts):
        print(t,'uri is',token.tokenURI(t),'owned by',token.ownerOf(t),'insta url:','https://instagram.com/p/' + token.instaURI(t))

def deploy_mtg():
    nft = MintTheGram.deploy({'from':accounts[0]})
    tx = nft.safeMint(accounts[2],'BqbzyYMgl-F',{'from':accounts[0]})
    print(tx.events)
    tx = nft.safeMint(accounts[3],'BqbzyYMgl-X',{'from':accounts[0]})
    print(tx.events)
    print('total supply:',nft.totalSupply())
    print('all balances')
    all_balances_nft(nft)
    print('all nfts')
    all_mtg_nfts(nft)
    return nft

def publish_mtg():
    nft = MintTheGram.deploy({'from':accounts[0]},publish_source=True)
    return nft



    


