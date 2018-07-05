#!groovy
supportedEnvs = ['devx', 'qax', 'stgx', 'stgxdr', 'prod-eu', 'prod']
automaticEnvs = ['devx', 'qax', 'stgx', 'stgxdr']

properties([
  parameters([
    choice(choices: '\n' + supportedEnvs.join('\n'), description: 'Target environment (blank for all)', name: 'Environment'),
    booleanParam(defaultValue: true, description: 'Run Integration Tests?', name: 'Tests')
  ]),
  pipelineTriggers([])
])

deployEnvs = env.Environment ? [env.Environment] : automaticEnvs

if (env.Tests == 'true')
  formulaIntegration()

if (env.BRANCH_NAME == "master") {
  // Publish a new gem version to Nexus
  formulaPublish()

  // Deploy to environments
  for (deployEnv in deployEnvs) {
    formulaDeploy(
      environment: deployEnv
    )
  }
}
