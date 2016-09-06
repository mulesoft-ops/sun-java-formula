#!groovy

// Run integration tests
formulaIntegration()

if (env.BRANCH_NAME == "master") {
  // Publish a new gem version to Nexus
  formulaPublish()

  // Deploy to environments
  for (deploy_env in ['dev', 'qa', 'qax', 'stg', 'stgx', 'prod']) {
    formulaDeploy {
      environment = deploy_env
    }
  }
}
