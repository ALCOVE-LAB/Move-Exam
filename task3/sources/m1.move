// Tasl3 - module 
module 0x42::M1{

    // TODO
    // Define a module friend M2
    friend 0x42::M2;
    
    // TODO
    // Define a function num that returns 66 with choose public or friend visibility
    public fun num():u64 {
        66
    }

    // TODO
    // Define a function num2 that returns 88 with choose public or friend visibility
    public(friend) fun num2():u64 {
        88
    }
}
