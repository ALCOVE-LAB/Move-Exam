module 0x42::M3{
    #[test]
    fun test(){
        use 0x42::M1::num;

        let n = num();
        assert(n == 66,0);
    }
}