          .text                         
          .globl main                   

          .data                         
          .align 2                      
_rndModule:                             # virtual table
          .word 0                       # parent
          .word _STRING0                # class name
          .word _rndModule.Init         
          .word _rndModule.Random       
          .word _rndModule.RndInt       

          .data                         
          .align 2                      
_Deck:                                  # virtual table
          .word 0                       # parent
          .word _STRING1                # class name
          .word _Deck.Init              
          .word _Deck.Shuffle           
          .word _Deck.GetCard           

          .data                         
          .align 2                      
_BJDeck:                                # virtual table
          .word 0                       # parent
          .word _STRING2                # class name
          .word _BJDeck.Init            
          .word _BJDeck.DealCard        
          .word _BJDeck.Shuffle         
          .word _BJDeck.NumCardsRemaining

          .data                         
          .align 2                      
_Player:                                # virtual table
          .word 0                       # parent
          .word _STRING3                # class name
          .word _Player.Init            
          .word _Player.Hit             
          .word _Player.DoubleDown      
          .word _Player.TakeTurn        
          .word _Player.HasMoney        
          .word _Player.PrintMoney      
          .word _Player.PlaceBet        
          .word _Player.GetTotal        
          .word _Player.Resolve         
          .word _Player.GetYesOrNo      

          .data                         
          .align 2                      
_Dealer:                                # virtual table
          .word _Player                 # parent
          .word _STRING4                # class name
          .word _Dealer.Init            
          .word _Player.Hit             
          .word _Player.DoubleDown      
          .word _Dealer.TakeTurn        
          .word _Player.HasMoney        
          .word _Player.PrintMoney      
          .word _Player.PlaceBet        
          .word _Player.GetTotal        
          .word _Player.Resolve         
          .word _Player.GetYesOrNo      

          .data                         
          .align 2                      
_House:                                 # virtual table
          .word 0                       # parent
          .word _STRING5                # class name
          .word _House.SetupGame        
          .word _House.SetupPlayers     
          .word _House.TakeAllBets      
          .word _House.TakeAllTurns     
          .word _House.ResolveAllPlayers
          .word _House.PrintAllMoney    
          .word _House.PlayOneGame      

          .data                         
          .align 2                      
_Main:                                  # virtual table
          .word 0                       # parent
          .word _STRING6                # class name



          .text                         
_rndModule_New:                         # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -16           
_L167:                                  
          li    $t0, 8                  
          sw    $t0, 4($sp)             
          jal   _Alloc                  
          move  $t1, $v0                
          li    $t0, 0                  
          sw    $t0, 4($t1)             
          la    $t0, _rndModule         
          sw    $t0, 0($t1)             
          move  $v0, $t1                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_Deck_New:                              # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -16           
_L168:                                  
          li    $t0, 16                 
          sw    $t0, 4($sp)             
          jal   _Alloc                  
          move  $t0, $v0                
          li    $t1, 0                  
          sw    $t1, 4($t0)             
          sw    $t1, 8($t0)             
          sw    $t1, 12($t0)            
          la    $t1, _Deck              
          sw    $t1, 0($t0)             
          move  $v0, $t0                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_BJDeck_New:                            # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -16           
_L169:                                  
          li    $t0, 16                 
          sw    $t0, 4($sp)             
          jal   _Alloc                  
          move  $t1, $v0                
          li    $t0, 0                  
          sw    $t0, 4($t1)             
          sw    $t0, 8($t1)             
          sw    $t0, 12($t1)            
          la    $t0, _BJDeck            
          sw    $t0, 0($t1)             
          move  $v0, $t1                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_Player_New:                            # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -32           
_L170:                                  
          li    $t3, 28                 
          sw    $t3, 4($sp)             
          sw    $t3, -8($fp)            
          jal   _Alloc                  
          move  $t0, $v0                
          lw    $t3, -8($fp)            
          li    $t2, 0                  
          li    $t1, 4                  
          add   $t0, $t0, $t3           
          sw    $t3, -8($fp)            
          sw    $t2, -12($fp)           
          sw    $t1, -16($fp)           
          sw    $t0, -20($fp)           
_L171:                                  
          lw    $t0, -20($fp)           
          lw    $t1, -16($fp)           
          lw    $t2, -8($fp)            
          sub   $t0, $t0, $t1           
          sub   $t2, $t2, $t1           
          sw    $t2, -8($fp)            
          sw    $t1, -16($fp)           
          sw    $t0, -20($fp)           
          beqz  $t2, _L173              
_L172:                                  
          lw    $t0, -20($fp)           
          lw    $t1, -12($fp)           
          sw    $t1, 0($t0)             
          sw    $t1, -12($fp)           
          sw    $t0, -20($fp)           
          b     _L171                   
_L173:                                  
          lw    $t0, -20($fp)           
          la    $t1, _Player            
          sw    $t1, 0($t0)             
          move  $v0, $t0                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_Dealer_New:                            # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -32           
_L174:                                  
          li    $t1, 28                 
          sw    $t1, 4($sp)             
          sw    $t1, -8($fp)            
          jal   _Alloc                  
          move  $t0, $v0                
          lw    $t1, -8($fp)            
          li    $t3, 0                  
          li    $t2, 4                  
          add   $t0, $t0, $t1           
          sw    $t3, -12($fp)           
          sw    $t2, -16($fp)           
          sw    $t0, -20($fp)           
          sw    $t1, -8($fp)            
_L175:                                  
          lw    $t0, -20($fp)           
          lw    $t2, -16($fp)           
          lw    $t1, -8($fp)            
          sub   $t0, $t0, $t2           
          sub   $t1, $t1, $t2           
          sw    $t2, -16($fp)           
          sw    $t0, -20($fp)           
          sw    $t1, -8($fp)            
          beqz  $t1, _L177              
_L176:                                  
          lw    $t0, -20($fp)           
          lw    $t1, -12($fp)           
          sw    $t1, 0($t0)             
          sw    $t1, -12($fp)           
          sw    $t0, -20($fp)           
          b     _L175                   
_L177:                                  
          lw    $t0, -20($fp)           
          la    $t1, _Dealer            
          sw    $t1, 0($t0)             
          move  $v0, $t0                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_House_New:                             # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -16           
_L178:                                  
          li    $t0, 16                 
          sw    $t0, 4($sp)             
          jal   _Alloc                  
          move  $t1, $v0                
          li    $t0, 0                  
          sw    $t0, 4($t1)             
          sw    $t0, 8($t1)             
          sw    $t0, 12($t1)            
          la    $t0, _House             
          sw    $t0, 0($t1)             
          move  $v0, $t1                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_Main_New:                              # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -16           
_L179:                                  
          li    $t0, 4                  
          sw    $t0, 4($sp)             
          jal   _Alloc                  
          move  $t1, $v0                
          la    $t0, _Main              
          sw    $t0, 0($t1)             
          move  $v0, $t1                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_rndModule.Init:                        # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -12           
_L180:                                  
          lw    $t1, 8($fp)             
          lw    $t2, 4($fp)             
          lw    $t0, 4($t2)             
          sw    $t1, 4($t2)             
          sw    $t2, 4($fp)             
          sw    $t1, 8($fp)             
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_rndModule.Random:                      # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -12           
_L181:                                  
          lw    $t2, 4($fp)             
          lw    $t0, 4($t2)             
          li    $t0, 15625              
          lw    $t3, 4($t2)             
          li    $t1, 10000              
          rem   $t1, $t3, $t1           
          mul   $t1, $t0, $t1           
          li    $t0, 22221              
          add   $t1, $t1, $t0           
          lui   $t0, 1                  
          rem   $t0, $t1, $t0           
          sw    $t0, 4($t2)             
          lw    $t0, 4($t2)             
          sw    $t2, 4($fp)             
          move  $v0, $t0                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_rndModule.RndInt:                      # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -16           
_L182:                                  
          lw    $t1, 8($fp)             
          lw    $t2, 4($fp)             
          sw    $t2, 4($sp)             
          lw    $t0, 0($t2)             
          lw    $t0, 12($t0)            
          sw    $t2, 4($fp)             
          sw    $t1, 8($fp)             
          jalr  $t0                     
          move  $t0, $v0                
          lw    $t2, 4($fp)             
          lw    $t1, 8($fp)             
          rem   $t0, $t0, $t1           
          sw    $t2, 4($fp)             
          sw    $t1, 8($fp)             
          move  $v0, $t0                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_Deck.Init:                             # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -36           
_L183:                                  
          lw    $t2, 4($fp)             
          lw    $t0, 8($t2)             
          li    $t1, 52                 
          li    $t0, 0                  
          slt   $t0, $t1, $t0           
          sw    $t2, 4($fp)             
          sw    $t1, -8($fp)            
          beqz  $t0, _L185              
_L184:                                  
          la    $t0, _STRING7           
          sw    $t0, 4($sp)             
          jal   _PrintString            
          jal   _Halt                   
_L185:                                  
          lw    $t0, -8($fp)            
          li    $t3, 4                  
          mul   $t1, $t3, $t0           
          add   $t2, $t3, $t1           
          sw    $t2, 4($sp)             
          sw    $t3, -12($fp)           
          sw    $t2, -16($fp)           
          sw    $t0, -8($fp)            
          jal   _Alloc                  
          move  $t1, $v0                
          lw    $t3, -12($fp)           
          lw    $t2, -16($fp)           
          lw    $t0, -8($fp)            
          sw    $t0, 0($t1)             
          li    $t0, 0                  
          add   $t1, $t1, $t2           
          sw    $t3, -12($fp)           
          sw    $t2, -16($fp)           
          sw    $t1, -20($fp)           
          sw    $t0, -24($fp)           
_L186:                                  
          lw    $t0, -16($fp)           
          lw    $t1, -12($fp)           
          sub   $t0, $t0, $t1           
          sw    $t1, -12($fp)           
          sw    $t0, -16($fp)           
          beqz  $t0, _L188              
_L187:                                  
          lw    $t0, -24($fp)           
          lw    $t2, -20($fp)           
          lw    $t1, -12($fp)           
          sub   $t2, $t2, $t1           
          sw    $t0, 0($t2)             
          sw    $t1, -12($fp)           
          sw    $t2, -20($fp)           
          sw    $t0, -24($fp)           
          b     _L186                   
_L188:                                  
          lw    $t0, -20($fp)           
          lw    $t1, 8($fp)             
          lw    $t3, 4($fp)             
          sw    $t0, 8($t3)             
          lw    $t0, 12($t3)            
          sw    $t1, 12($t3)            
          sw    $t3, 4($fp)             
          sw    $t1, 8($fp)             
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     

_Deck.Shuffle:                          # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -60           
_L189:                                  
          lw    $t1, 4($fp)             
          lw    $t0, 4($t1)             
          li    $t0, 1                  
          sw    $t0, 4($t1)             
          sw    $t1, 4($fp)             
_L191:                                  
          lw    $t1, 4($fp)             
          lw    $t2, 4($t1)             
          li    $t0, 52                 
          sle   $t0, $t2, $t0           
          sw    $t1, 4($fp)             
          beqz  $t0, _L196              
_L192:                                  
          lw    $t0, 4($fp)             
          lw    $t3, 8($t0)             
          lw    $t2, 4($t0)             
          li    $t1, 1                  
          sub   $t2, $t2, $t1           
          lw    $t1, -4($t3)            
          slt   $t1, $t2, $t1           
          sw    $t3, -8($fp)            
          sw    $t2, -12($fp)           
          sw    $t0, 4($fp)             
          beqz  $t1, _L194              
_L193:                                  
          lw    $t1, -12($fp)           
          li    $t0, 0                  
          slt   $t0, $t1, $t0           
          sw    $t1, -12($fp)           
          beqz  $t0, _L195              
_L194:                                  
          la    $t0, _STRING8           
          sw    $t0, 4($sp)             
          jal   _PrintString            
          jal   _Halt                   
_L195:                                  
          lw    $t1, -12($fp)           
          lw    $t3, -8($fp)            
          lw    $t0, 4($fp)             
          li    $t2, 4                  
          mul   $t2, $t1, $t2           
          add   $t2, $t3, $t2           
          lw    $t2, 0($t2)             
          lw    $t4, 4($t0)             
          li    $t2, 13                 
          rem   $t4, $t4, $t2           
          li    $t2, 4                  
          mul   $t1, $t1, $t2           
          add   $t1, $t3, $t1           
          sw    $t4, 0($t1)             
          sw    $t0, 4($fp)             
_L190:                                  
          lw    $t1, 4($fp)             
          lw    $t0, 4($t1)             
          lw    $t2, 4($t1)             
          li    $t0, 1                  
          add   $t0, $t2, $t0           
          sw    $t0, 4($t1)             
          sw    $t1, 4($fp)             
          b     _L191                   
_L196:                                  
          lw    $t0, 4($fp)             
          lw    $t1, 4($t0)             
          lw    $t2, 4($t0)             
          li    $t1, 1                  
          sub   $t1, $t2, $t1           
          sw    $t1, 4($t0)             
          sw    $t0, 4($fp)             
_L197:                                  
          lw    $t0, 4($fp)             
          lw    $t2, 4($t0)             
          li    $t1, 0                  
          sgt   $t1, $t2, $t1           
          sw    $t0, 4($fp)             
          beqz  $t1, _L211              
_L198:                                  
          lw    $t0, 4($fp)             
          lw    $t2, 12($t0)            
          lw    $t1, 4($t0)             
          sw    $t2, 4($sp)             
          sw    $t1, 8($sp)             
          lw    $t1, 0($t2)             
          lw    $t1, 16($t1)            
          sw    $t0, 4($fp)             
          jalr  $t1                     
          move  $t1, $v0                
          lw    $t0, 4($fp)             
          move  $t4, $t1                
          lw    $t1, 4($t0)             
          lw    $t2, 4($t0)             
          li    $t1, 1                  
          sub   $t1, $t2, $t1           
          sw    $t1, 4($t0)             
          lw    $t3, 8($t0)             
          lw    $t2, 4($t0)             
          lw    $t1, -4($t3)            
          slt   $t1, $t2, $t1           
          sw    $t3, -20($fp)           
          sw    $t0, 4($fp)             
          sw    $t2, -24($fp)           
          sw    $t4, -16($fp)           
          beqz  $t1, _L200              
_L199:                                  
          lw    $t1, -24($fp)           
          li    $t0, 0                  
          slt   $t0, $t1, $t0           
          sw    $t1, -24($fp)           
          beqz  $t0, _L201              
_L200:                                  
          la    $t0, _STRING8           
          sw    $t0, 4($sp)             
          jal   _PrintString            
          jal   _Halt                   
_L201:                                  
          lw    $t1, -24($fp)           
          lw    $t3, -20($fp)           
          lw    $t0, 4($fp)             
          li    $t2, 4                  
          mul   $t1, $t1, $t2           
          add   $t1, $t3, $t1           
          lw    $t1, 0($t1)             
          lw    $t4, 8($t0)             
          lw    $t3, 4($t0)             
          lw    $t2, -4($t4)            
          slt   $t2, $t3, $t2           
          sw    $t4, -32($fp)           
          sw    $t3, -36($fp)           
          sw    $t0, 4($fp)             
          sw    $t1, -28($fp)           
          beqz  $t2, _L203              
_L202:                                  
          lw    $t1, -36($fp)           
          li    $t0, 0                  
          slt   $t0, $t1, $t0           
          sw    $t1, -36($fp)           
          beqz  $t0, _L204              
_L203:                                  
          la    $t0, _STRING8           
          sw    $t0, 4($sp)             
          jal   _PrintString            
          jal   _Halt                   
_L204:                                  
          lw    $t1, -36($fp)           
          lw    $t4, -32($fp)           
          lw    $t5, -16($fp)           
          lw    $t0, 4($fp)             
          li    $t2, 4                  
          mul   $t2, $t1, $t2           
          add   $t2, $t4, $t2           
          lw    $t2, 0($t2)             
          lw    $t3, 8($t0)             
          lw    $t2, -4($t3)            
          slt   $t2, $t5, $t2           
          sw    $t4, -32($fp)           
          sw    $t1, -36($fp)           
          sw    $t0, 4($fp)             
          sw    $t5, -16($fp)           
          sw    $t3, -40($fp)           
          beqz  $t2, _L206              
_L205:                                  
          lw    $t1, -16($fp)           
          li    $t0, 0                  
          slt   $t0, $t1, $t0           
          sw    $t1, -16($fp)           
          beqz  $t0, _L207              
_L206:                                  
          la    $t0, _STRING8           
          sw    $t0, 4($sp)             
          jal   _PrintString            
          jal   _Halt                   
_L207:                                  
          lw    $t3, -40($fp)           
          lw    $t1, -36($fp)           
          lw    $t4, -32($fp)           
          lw    $t5, -16($fp)           
          lw    $t0, 4($fp)             
          li    $t2, 4                  
          mul   $t2, $t5, $t2           
          add   $t2, $t3, $t2           
          lw    $t3, 0($t2)             
          li    $t2, 4                  
          mul   $t2, $t1, $t2           
         Exception in thread "main" java.lang.NullPointerException
	at decaf.backend.InferenceGraph.addEdge(InferenceGraph.java:69)
	at decaf.backend.InferenceGraph.makeEdges(InferenceGraph.java:201)
	at decaf.backend.InferenceGraph.makeGraph(InferenceGraph.java:120)
	at decaf.backend.InferenceGraph.alloc(InferenceGraph.java:42)
	at decaf.backend.GraphColorRegisterAllocator.alloc(GraphColorRegisterAllocator.java:41)
	at decaf.backend.mips.Mips.emitAsm(Mips.java:107)
	at decaf.Driver.compile(Driver.java:136)
	at decaf.Driver.main(Driver.java:144)
