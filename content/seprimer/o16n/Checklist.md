+++
date = "2017-02-28T11:06:26-05:00"
title = "Operational Readiness Checklist"
tags = ["programming","software engineering"]
categories = ["software engineering: a primer"]
+++
## How to Use This Checklist
All boxes should be addressed. There are three valid states: Implemented,
Designed, or N/A. If the implementation description is short enough, such as a
line or two, it can be described here. Otherwise, provide a link to the
necessary information. The same applies for Designed.

## Configuration
- [ ] Service configuration is managed in a central location
- [ ] Configuration is version-controlled

## Security Management
- [x] No secrets are stored within artifacts
- [ ] Identify secrets within service
    - Type of secret: (account|service)
    - Procedure for updating secrets
- [ ] Determine required networking availability, per service
    - [ ] Identify required network ports
    - [ ] Identify valid users & their IP locations
    - [ ] Create firewall rules

## Backup
- [ ] Identify persistent application data
    1.
- [ ] Document the backup requirements
    - [ ] Size of backup
    - [ ] Number of backups
    - [ ] Frequency of backups
- [ ] Document the backup procedure
- [ ] Test the backup procedure
    - [ ] Time required:

## Maintenance
- [ ] Identify required ongoing maintenance
- [ ] Each maintenance task has
    - [ ] Procedure
    - [ ] Time schedule
    - [ ] Operator access to necessary systems

## Disaster Recovery
- [ ] Identify disaster scenarios
    1.
- [ ] Restart each service, and observe effects
- [ ] Document disaster recovery process
    - [ ] Documentation location:
    - [ ] Criteria for using procedure:
- [ ] Test disaster recovery with real data
- [ ] Time required for a full restore:

## Performance & Availability
- [ ] Service is Highly Available
    - [ ] Document how HA is achieved
    - [ ] HA: (active/active || active/passive)
    - [ ] Document the faillover procedure
    - [ ] Test the failover
- [ ] Estimate expected traffic:
- [ ] Perform load testing
    - [ ] Develop a load testing script
        - [ ] 1.0:
        - [ ] 1.5:
        - [ ] 2.0:

## Monitoring
- [x] Logs are being directed to syslog
    - [x] Logs are tagged with a unique service identifier
- [x] Logs are appearing in Logz.io
    - [ ] Create a dashboard per-service
- [ ] Host|Service|Service statistics are being collected
    - [ ] Identify key statistics
        1.
- [ ] Create a generic host-metrics dashboard
- [ ] Create summary dashbaords for key statistics

## Alerting
- [ ] Identify key performance requirements/indicators
    - [ ] Diagnose the problem
    - [ ] Create an automatic action for fixing or diagnosing the problem
    - [ ] Create an associated playbook
    - [ ] Classify with severity (Low/Medium/Critical)
    - [ ] Identify Slack channel for alerts: #sensu-alerts
- [ ] Create a synthetic acceptance test of key behavior
- [ ] Verify Pager Duty rotation

## Build

## Deployment
- [ ] Deployment has been automated to a single command
    - [ ] View currently deployed versions of a service
    - [ ] View available versions for deployment
    - [ ] Canary deployment to a single box
    - [ ] Rolling deployment to remaining boxes
- [ ] Rollback procedure
    - [ ] Document how to rollback a release
    - [ ] Test rollback procedure

## Resources
- [Google Cloud Platform Pre-launch
Checklist](https://cloud.google.com/docs/platform-launch-checklist)
- [AWS Operational Checklist](https://media.amazonwebservices.com/AWS_Operational_Checklists.pdf)
