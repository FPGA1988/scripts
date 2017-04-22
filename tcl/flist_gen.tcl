#所有代码如下，使用注释的方式讲解脚本
#修改好文件夹和保存结果路径，可以把本文件直接拷贝进tcl解释器运行

#脚本目的：返回一个文件夹下所有的文件的绝对路径
#主要讲述和操作的命令cd、pwd、glob
#次要命令：file、open、catch

#脚本思想：使用递归返回所有的文件路径，可以遍历到所有的子文件夹

#脚本以在window目录下为例，需要在其它系统下请修改路径名
#需要返回文件路径的文件夹,需要注意在windows下路径名用/间隔，tcl语言中用/间隔
set dirpath "G:/Xilinx/14.7/ISE_DS/ISE/secureip/mti"


#进入文件夹中
cd $dirpath
pwd

#结果保存在文件中，此处以windows系统下为例



set resultfile "$dirpath/mti_secureip.list.f"
#if { [file exists $resultfile] }
#{
#    file delete  $resultfile
#}
#打开保存结果的文件
#catch用于捕捉发生的错误，使脚本不会应为错误而中断，脚本中捕捉到错误会使用exit退出
#result变量存储打开的结果文件I/O通道ID
if { [catch {set result [open $resultfile w+]} err] } {
   puts $err
   exit
}

#用于返回文件路径名的过程
#myDir需要返回文件路径的文件夹名
#result为保存结果的文件I/O通道ID
proc FindFile { myDir result } {
   #进入目录
   if {[catch {cd $myDir} err]} {
      puts $result $err
      return
   }
   
   #遍历目录中所有文件和文件夹
   #如果是文件夹则递归调用FindFile过程
   #如果是文件直接把路径记录到结果文件中
   foreach myfile [glob -nocomplain *] {
       #进入递归后有可能修改当前的目录，
       #因为file命令只能对当前路径有效果，
       #所以需要保证在正确的目录下操作文件
       cd $myDir
    
       #如果文件夹是空的，则会返回空，不记录文件夹
      if {[string equal $myfile ""]} {
        return
      } 
   
   
      set fullfile [file join $myDir $myfile]
   
      #判断是文件夹还是文件
      #如果是文件夹则递归调用FindFile过程
      #如果是文件直接把路径记录到结果文件中
      #使用file extension $myfile来判断文件的后缀
      if {[file isdirectory $myfile]} {
        #puts $result $fullfile
        FindFile $fullfile $result
      } elseif {[file extension $myfile] eq ".vp"} {
        puts $result "\"$fullfile\""
      }
   }
}

#执行脚本命令，返回结果
FindFile $dirpath $result

#关闭保存结果的文件I/O通道
close $result
