module 0x42::M2{
    #[test]
    fun test(){
        use 0x42::M1::num;
        let n = num();
        assert!(n == 66, 1);
    }

    #[test]
    fun test2(){
        use 0x42::M1::num2;

        let n = num2();
        assert!(n == 88, 1);
    }
}