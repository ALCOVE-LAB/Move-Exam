// Task4 - Object
// 1. Create a deleteable object
// 2. Create a named object
// 3. Create a sticky object
module 0x42::Task4 {
    use std::debug::print;
    use aptos_framework::object;
    use aptos_framework::object::{Object, ConstructorRef, ObjectCore};

    use std::signer;

    const NAME:vector<u8> = b"myObject"; 

    // TODO
    // 1. create a deleteable object
    public fun createDeleteableObject(caller: &signer):ConstructorRef {
        // ...
        let caller_addr = signer::address_of(caller);
        let obj = object::create_object(caller_addr);
        obj
    }

    // TODO
    // 2. create a named object
    public fun createNamedObject(caller: &signer):ConstructorRef {
        // ...
        let obj = object::create_named_object(caller, NAME);
        obj
    }

    // TODO
    // 3. create a sticky object
    public fun createStickyObject(caller: &signer):ConstructorRef {
        // ...
        let caller_addr = signer::address_of(caller);
        let obj = object::create_sticky_object(caller_addr);
        obj
    }

    #[test(caller = @0x88)]
    fun testCreateDeleteableObject(caller: &signer) {
        let obj = createDeleteableObject(caller);
        let delete_ref = object::generate_delete_ref(&obj);
        aptos_framework::object::delete(delete_ref);
    }

    #[test(caller = @0x88)]
    fun testCreateNamedObject(caller: &signer) {
        let obj = createNamedObject(caller);
        print(&obj);
    }

    #[test(caller = @0x88)]
    fun testCreateStickyObject(caller: &signer) {
        let obj = createStickyObject(caller);
        let obj2 = createStickyObject(caller);
        print(&obj);
        print(&obj2);
    }
}
