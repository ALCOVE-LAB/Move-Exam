// Task2 - drop, copy, store
module 0x42::Task2{
    use std::signer;

    // TODO
    // Define a struct Foo with two fields: u: u64, b: bool with ability to drop
    struct Foo has drop {
        u:u64,b:bool
       // ...
    }

    // TODO
    // Define a function gen_Fool that takes two arguments: u: u64, b: bool and returns a Foo
    fun gen_Fool(u:u64, b:bool):Foo {
        // ...
        let a = Foo{
            u,b
        };
        a
    }

    #[test]
    fun test(){
        let f = gen_Fool(42, true); // need to drop f
        assert!(f.u == 42,0);
        assert!(f.b == true,1);
    }

    #[test]
    fun test2(){
        let f = gen_Fool(42, true);
        let Foo{u,b} = &mut f;
        *u = 43;
        assert!(f.u == 43,0);
        assert!(f.b == true,1);
    }

    // TODO
    // Define a struct Soo with two fields: x: u64, y: u64 with ability to copy
    struct Soo has copy,drop{
        // ...
        x:u64,y:u64
    }

    // TODO
    // Define a function gen_Soo that takes two arguments: x: u64, y: u64 and returns a Soo
    fun gen_Soo(x:u64, y:u64):Soo {
        // ...
        let a= Soo{x,y};
        a
    }

    #[test]
    fun test3(){
        let c = gen_Soo(42, 43);
        let c2 = copy c;
        let Soo{x,y} = &mut c2;
        *x = 44;
        assert!(c.x == 42,0);
        assert!(c2.x == 44,1);
    }

    // TODO
    // Define a struct Koo with a field: s: Moo with ability
    struct Koo has drop {
        s: Moo
    }

    // TODO
    // Define a struct Moo with a field: x: u64 with ability
    struct Moo has drop {
        x: u64
    }


    // TODO
    // Define a function gen_Moo that takes an argument: x: u64 and returns a Moo
    fun gen_Moo(x:u64):Moo {
        let a=Moo{x};
        a
        // ...
    }

    #[test]
    fun test4(){
        let s = gen_Moo(42);
        let k = Koo{s: s};
        assert!(k.s.x == 42,0);
    }
}
