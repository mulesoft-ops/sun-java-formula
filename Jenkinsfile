#!groovy

// Run integration tests
//formulaIntegration()

if (env.BRANCH_NAME == "ohio") {
  // Publish a new gem version to Nexus
  formulaPublish()

  // Deploy to environments
  for (deploy_env in ['stgz']) {
    formulaDeploy {
      environment = deploy_env
    }
  }
}
