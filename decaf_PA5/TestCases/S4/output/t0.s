Exception in thread "main" java.lang.NullPointerException
	at decaf.backend.InferenceGraph.addEdge(InferenceGraph.java:69)
	at decaf.backend.InferenceGraph.makeEdges(InferenceGraph.java:200)
	at decaf.backend.InferenceGraph.makeGraph(InferenceGraph.java:120)
	at decaf.backend.InferenceGraph.alloc(InferenceGraph.java:42)
	at decaf.backend.GraphColorRegisterAllocator.alloc(GraphColorRegisterAllocator.java:41)
	at decaf.backend.mips.Mips.emitAsm(Mips.java:107)
	at decaf.Driver.compile(Driver.java:136)
	at decaf.Driver.main(Driver.java:144)
