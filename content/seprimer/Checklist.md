# Gateway Operational Checklist

Testing proves your service's _correctness_; "it does what I think it does".
Monitoring asserts your service's environment; "it is what I think it is".
Similar to testing, monitoring can adopt a black- v. white-box strategy.

Black-box monitoring can look like running an acceptance test against the system ("synthetic data"),
or verifying service dependencies are functioning _outside_ of the service. You could verify that
the database is up and running, or connectable from another endpoint. It is the sum of what's
proveable around the application, without the application's vote.

White-box monitoring asks the application for what it thinks is working; does it have a DB
connection? Has it connected to _all_ of its external dependencies? What are the runtime statistics
it has collected? It is the view of the world from inside the application.


### Configuration
- [x] Service configuration is managed in a central location
    - All runtime configuration is stored in [Consul]
- [x] Configuration is version-controlled
    - All configuration is stored in GPG-encrypted tarfiles inside of the respective code
      repositories. The current standard is to store them within `config/`.

### Security Management
- [x] No secrets are stored within artifacts
- [ ] Identify secrets within service
    1. ______
    - Secret role: (account|service)
    - Process for updating secrets
- [ ] Determine required networking availability, per service
    - [ ] Identify required network ports
    - [ ] Identify valid users & their IP locations
    - [ ] Create firewall rules

### Backup
- [ ] Identify persistent application data
    1. ______
- [ ] Document the backup requirements
    - [ ] Size of backup
    - [ ] Number of backups
    - [ ] Frequency of backups
- [ ] Document the backup procedure
- [ ] Test the backup procedure
    - [ ] Time required: ______

### Maintenance
- [ ] Identify required ongoing maintenance: [Maintenance.md](./Maintenance.md)
- [ ] Each maintenance task has a:
    - [ ] Procedure
    - [ ] Time schedule
    - [ ] Operator access to necessary systems

### Disaster Recovery
- [ ] Identify disaster scenarios
    1. ______
- [ ] Restart each service, and observe effects
- [ ] Document disaster recovery process
    - [ ] Documentation location: ______
    - [ ] Criteria for using procedure: ______
- [ ] Test disaster recovery with real data
- [ ] Time required for a full restore: ______

### Performance & Availability
- [x] Service is Highly Available
    - [ ] Document how HA is achieved
    - [ ] HA: ______ (active/active || active/passive)
    - [ ] Document the faillover procedure
    - [ ] Test the failover
- [ ] Estimate expected traffic: ______
- [ ] Perform load testing
    - [ ] Develop a load testing script: ______
    - [ ] 1.0: ______ (requests processed/second, or link to output)
    - [ ] 1.5: ______
    - [ ] 2.0: ______

### Monitoring
- [x] Logs are being directed to syslog
    - [x] Logs are tagged with a unique service identifier
- [x] Logs are appearing in Logz.io
    - [ ] Create a dashboard per-service
- [ ] Host|Service|Service statistics are being collected
    - [ ] Identify key statistics
        1. ______
- [ ] Create a generic host-metrics dashboard
- [ ] Create summary dashbaords for key statistics

### Alerting
[INTC Sensu](https://100.88.3.132/#/events)
[Production Sensu](https://uchiwa.dynback.net/#/events)

- [ ] Identify key performance requirements/indicators
    - CRITICAL
        1. Registered routes are not being served
        1. Fail to authenticate against IAM
        1. Disk usage exceeds 95%
        1. Only one instance of service is running
        1. Consul doesn't have a leader for >1min
        1. Caddy isn't running, but CaddyWatch is
    - WARNING
        1. CPU usage exceeds 80%
        1. Disk usage exceeds 80%
        1. Less than 50% of services are running across cluster
- [ ] Alerts have been created
    - [ ] Collect diagnostic information on the problem
    - [ ] Create an automatic action for fixing or diagnosing the problem
    - [ ] Create an associated playbook
    - [ ] Classify with severity (Low/Medium/Critical)
    - [ ] Identify Slack channel for alerts: #sensu-alerts
- [ ] Create a synthetic acceptance test of key behavior
- [ ] Verify Pager Duty rotation

### Build Process
- [ ] Each commit to `master` has undergone commit testing
    - [ ] Compilation
    - [ ] Unit tests
    - [ ] Static analysis
- [ ] New code is auto-deployed into the integration environment
- [ ] Integration tests are run automatically
- [ ] Acceptance tests are run automatically

### Deployment
- [ ] Deployment has been automated to a single command
    - [ ] View currently deployed versions of a service
    - [ ] View available versions for deployment
    - [ ] Canary deployment to a single box
    - [ ] Rolling deployment to remaining boxes
- [ ] Rollback procedure
    - [ ] Document how to rollback a release
    - [ ] Test rollback procedure

## Resources
- [Operation Readinesss Scoring
  System](https://wiki.corp.dyndns.com/display/NOC/Operational+Readiness+Scoring+System#OperationalReadinessScoringSystem-AlertsShouldbeActionable,ofaConsistentFormat,andLinkedtoPlaybooks)
- [Google Cloud Platform Pre-launch
Checklist](https://cloud.google.com/docs/platform-launch-checklist)
- [AWS Operational Checklist](https://media.amazonwebservices.com/AWS_Operational_Checklists.pdf)

[Consul]: https://api24-01-ussnn1.prod.dc.dynback.net:8501/ui
