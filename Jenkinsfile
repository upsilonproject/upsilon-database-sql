#!groovy                                                                           

def prepareEnv() {
	deleteDir()                                                                    
                                                                                   
    unstash 'binaries'                                                             
                                                                                   
    env.WORKSPACE = pwd()                                                          
                                                                                   
    sh "find ${env.WORKSPACE}"                                                     

	sh 'mkdir -p SPECS SOURCES'                                                    
    sh "cp build/distributions/*.zip SOURCES/upsilon-database-sql.zip"                      
}


def buildRpm(dist) {                                                               
	prepareEnv()                                                                                      
                                                                                      
    sh 'unzip -jo SOURCES/upsilon-database-sql.zip "upsilon-database-sql-*/upsilon-database-sql.spec" "upsilon-database-sql-*/.buildid.rpmmacro" -d SPECS/'
    sh "find ${env.WORKSPACE}"                                                     
                                                                                   
    sh "rpmbuild -ba SPECS/upsilon-database-sql.spec --define '_topdir ${env.WORKSPACE}' --define 'dist ${dist}'"
                                                                                   
    archive 'RPMS/noarch/*.rpm'                                                    
	stash includes: "RPMS/noarch/*.rpm", name: dist
}                                                                                  
                                                                                   
node {                                                                             
    stage "Prep"                                                                   
                                                                                   
    deleteDir()                                                                    
    def gradle = tool 'gradle'                                                     
                                                                                   
    checkout scm                                                              
	
	sh "make"
    sh "${gradle}/bin/gradle distZip"                                              
                                                                                   
	archive 'build/distributions/*.zip'
    stash includes:"build/distributions/*.zip", name: "binaries"                   
}                                                                                  
                                                                                   
stage ("Package") {                                                          
	node {                                                                             
		buildRpm("el6")                                                                
	}
	node {                                                                             
		buildRpm("el7")                                                                
	}                                                                                  
	node {                                                                             
		buildRpm("fc26")
	}                                                                                  
}
