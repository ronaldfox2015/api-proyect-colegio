#!groovy

pipeline {
  agent any
  options {
    skipDefaultCheckout true
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('versioned') {
      steps {
        sh 'make build'
      }
    }
    stage('cli') {
      steps {
        sh 'make build-cli ENV=${ENV} BRANCH=${BRANCH}'
      }
    }
    stage('codedeploy') {
      steps {
        sh 'make codedeploy ENV=${ENV} BRANCH=${BRANCH}'
      }
    }
    stage('solr') {
      steps {
        sh 'make deploy-solr ENV=${ENV} BRANCH=${BRANCH} SOLR_DB=${SOLR_DB} SOLR_USER=${SOLR_USER} SOLR_PWD=${SOLR_PWD}'
      }
    }
    stage('npm') {
      steps {
        sh 'make build-cds ENV=${ENV} BRANCH=${BRANCH}'
      }
    }
  }
}