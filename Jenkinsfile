podTemplate(label: 'mypod', containers: [
    containerTemplate(name: 'git', image: 'alpine/git', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'python', image: 'python:3.7.2', command: 'cat', ttyEnabled: true)
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
    emptyDirVolume(mountPath: '/etc/gitrepo', memory: false)
  ]
  ) {
    node('mypod') {
        stage('Clone repository') {
            container('git') {
                sh 'git clone -b master https://github.com/alicek106/python-jenkins-example.git /etc/gitrepo'
            }
        }
        stage('build') {
            container('python') {
                sh 'pip install -r /etc/gitrepo/requirements.txt'
                sh 'python /etc/gitrepo/test.py /etc/gitrepo/server'
                sh 'cp /etc/gitrepo/test-reports/*.xml $WORKSPACE'
                junit '*.xml'
            }
        }
    }
}
