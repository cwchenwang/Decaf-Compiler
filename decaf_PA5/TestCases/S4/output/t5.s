Exception in thread "main" java.lang.IllegalArgumentException: Register allocation incomplete!
	at decaf.backend.GraphColorRegisterAllocator.findReg(GraphColorRegisterAllocator.java:159)
	at decaf.backend.GraphColorRegisterAllocator.findRegForWrite(GraphColorRegisterAllocator.java:163)
	at decaf.backend.GraphColorRegisterAllocator.alloc(GraphColorRegisterAllocator.java:74)
	at decaf.backend.mips.Mips.emitAsm(Mips.java:107)
	at decaf.Driver.compile(Driver.java:136)
	at decaf.Driver.main(Driver.java:144)
