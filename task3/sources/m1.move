// Tasl3 - module 

// Observe the function permissions called in M1, M2, and M3.
// modify the visibility of the functions in M1, and set the M1 module visibility.
module 0x42::M1{

    // TODO
    // Define a module friend M2
    friend 0x42::M2;
    
    // TODO
    // Define a function num that returns 66 with choose public or friend visibility
    public(friend) fun num():u64 {
        66
    }

    // TODO
    // Define a function num2 that returns 88 with choose public or friend visibility
    public(friend) fun num2():u64 {
        88
    }
}