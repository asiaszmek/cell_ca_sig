def mesh(fname):
	import numpy as np
	vertex=[]
	f=open(fname,"r")
	fw=""

	for line in f:
    		if line.find("o ")==0:
			if type(fw)is not file: #initiate opening a file to write
				fw_name=line[2:-1]
				fw=open(fw_name,"w+")
			else: 			#open another file to write and close the current one
				fw.write("\nend_file\n")
				fw.close()
				fw_name=line[2:-1]
				fw=open(fw_name,"w+")
		
    		if line.find("v ")==0:
			tmp=line[2:-1]
			tmp=tmp.strip().split()
			tmp=np.array(tmp)
			vertex.append(tmp.astype(np.float))

    		elif line.find("f ")==0:
			tmp=line[2:-1]
			tmp=tmp.strip().split()
			tmp=np.array(tmp)
			connect=tmp.astype(np.integer)

			#print line, "len(vertex):", len(vertex), "connect[1]:", connect[1], "vertex[connect[1]]:", vertex[connect[1]] 
			tmpstr0="%s" %vertex[connect[0]-1]  #vertex indexing starting from 0
			tmpstr0=tmpstr0.strip("[").strip("]")	
			tmpstr1="%s" %vertex[connect[1]-1]
			tmpstr1=tmpstr1.strip("[").strip("]")
			tmpstr2="%s" %vertex[connect[2]-1]
			tmpstr2=tmpstr2.strip("[").strip("]")	
			string="panel t " + tmpstr0+" "+tmpstr1+ " "+tmpstr2+"\n"
			fw.write(string)


	f.close()
	fw.write("\nend_file\n")
	fw.close()
