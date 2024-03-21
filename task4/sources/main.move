// Task4 - Object
// 1. Create a deleteable object
// 2. Create a named object
// 3. Create a sticky object
module 0x42::Task4 {
    use aptos_framework::object::{Self, ConstructorRef};

    use std::signer;

    const NAME:vector<u8> = b"myObject"; 

    // TODO
    // 1. create a deleteable object
    public fun createDeleteableObject(caller: &signer):ConstructorRef {
        // ...
        let caller_addr = signer::address_of(caller);
        let obj = object :: create_object(caller_addr);
        obj
    }

    // TODO
    // 2. create a named object
    public fun createNamedObject(caller: &signer):ConstructorRef {
        // ...
        let caller_addr = signer :: address_of(caller);
        let obj = object :: create_named_object(caller, NAME);
        obj
    }

    // TODO
    // 3. create a sticky object
    public fun createStickyObject(caller: &signer):ConstructorRef {
        // ...
        let caller_addr = signer :: address_of(caller);
        let obj = createStickyObject(caller);
        obj
    }

    #[test(caller = @0x88)]
    fun testCreateDeleteableObject(caller: &signer) {
        let obj = createDeleteableObject(caller);
        assert!( object::address_from_constructor_ref(&obj) == @0xe46a3c36283330c97668b5d4693766b8626420a5701c18eb64026075c3ec8a0a, 1);
        let delete_ref = object::generate_delete_ref(&obj);
        aptos_framework::object::delete(delete_ref);
    }

    #[test(caller = @0x88)]
    fun testCreateNamedObject(caller: &signer) {
        let obj = createNamedObject(caller);
        assert!( object::address_from_constructor_ref(&obj) == @0x833ab2477b9a8f6d4388d8c8a05b7617a864c622a8c96ecfc38fa6a40aa07247, 1);
    }

    #[test(caller = @0x88)]
    fun testCreateStickyObject(caller: &signer) {
        let obj = createStickyObject(caller);
        let obj2 = createStickyObject(caller);
        assert!( object::address_from_constructor_ref(&obj) == @0xe46a3c36283330c97668b5d4693766b8626420a5701c18eb64026075c3ec8a0a, 1);
        assert!( object::address_from_constructor_ref(&obj2) == @0xfab16b00983f01e5c2b7682472a4f4c3e5929fbba987958570b6290c02817df2, 1);

    }
}