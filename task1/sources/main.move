// Task1 - Struct
// Create a struct called Wallet with a single field called balance of type u64.
module 0x42::Task1 {

    // TODO
    // Define a struct called Wallet with a single field called balance of type u64.
    struct Wallet has drop {
        balance: u64,
    }

    // TODO
    // Define a function called myWallet that returns a Wallet with a balance of 1000.
    fun myWallet(): Wallet {
        let wallet = Wallet {
           balance: 1000
        };
        wallet
    }

    #[test]
    fun test_wallet() {
        let wallet = myWallet();
        assert!(wallet.balance == 1000, 0);
    }
}