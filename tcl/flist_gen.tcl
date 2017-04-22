#���д������£�ʹ��ע�͵ķ�ʽ����ű�
#�޸ĺ��ļ��кͱ�����·�������԰ѱ��ļ�ֱ�ӿ�����tcl����������

#�ű�Ŀ�ģ�����һ���ļ��������е��ļ��ľ���·��
#��Ҫ�����Ͳ���������cd��pwd��glob
#��Ҫ���file��open��catch

#�ű�˼�룺ʹ�õݹ鷵�����е��ļ�·�������Ա��������е����ļ���

#�ű�����windowĿ¼��Ϊ������Ҫ������ϵͳ�����޸�·����
#��Ҫ�����ļ�·�����ļ���,��Ҫע����windows��·������/�����tcl��������/���
set dirpath "G:/Xilinx/14.7/ISE_DS/ISE/secureip/mti"


#�����ļ�����
cd $dirpath
pwd

#����������ļ��У��˴���windowsϵͳ��Ϊ��



set resultfile "$dirpath/mti_secureip.list.f"
#if { [file exists $resultfile] }
#{
#    file delete  $resultfile
#}
#�򿪱��������ļ�
#catch���ڲ�׽�����Ĵ���ʹ�ű�����ӦΪ������жϣ��ű��в�׽�������ʹ��exit�˳�
#result�����洢�򿪵Ľ���ļ�I/Oͨ��ID
if { [catch {set result [open $resultfile w+]} err] } {
   puts $err
   exit
}

#���ڷ����ļ�·�����Ĺ���
#myDir��Ҫ�����ļ�·�����ļ�����
#resultΪ���������ļ�I/Oͨ��ID
proc FindFile { myDir result } {
   #����Ŀ¼
   if {[catch {cd $myDir} err]} {
      puts $result $err
      return
   }
   
   #����Ŀ¼�������ļ����ļ���
   #������ļ�����ݹ����FindFile����
   #������ļ�ֱ�Ӱ�·����¼������ļ���
   foreach myfile [glob -nocomplain *] {
       #����ݹ���п����޸ĵ�ǰ��Ŀ¼��
       #��Ϊfile����ֻ�ܶԵ�ǰ·����Ч����
       #������Ҫ��֤����ȷ��Ŀ¼�²����ļ�
       cd $myDir
    
       #����ļ����ǿյģ���᷵�ؿգ�����¼�ļ���
      if {[string equal $myfile ""]} {
        return
      } 
   
   
      set fullfile [file join $myDir $myfile]
   
      #�ж����ļ��л����ļ�
      #������ļ�����ݹ����FindFile����
      #������ļ�ֱ�Ӱ�·����¼������ļ���
      #ʹ��file extension $myfile���ж��ļ��ĺ�׺
      if {[file isdirectory $myfile]} {
        #puts $result $fullfile
        FindFile $fullfile $result
      } elseif {[file extension $myfile] eq ".vp"} {
        puts $result "\"$fullfile\""
      }
   }
}

#ִ�нű�������ؽ��
FindFile $dirpath $result

#�رձ��������ļ�I/Oͨ��
close $result
