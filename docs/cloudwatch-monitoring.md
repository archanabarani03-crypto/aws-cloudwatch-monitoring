# AWS CloudWatch EC2 Monitoring

## Overview

This project configures Amazon CloudWatch monitoring for an EC2 instance.

## Monitoring

The CloudWatch Agent collects:

- Memory utilization
- Disk utilization

The custom metrics are published under the `CWAgent` namespace.

## Memory Alarm

Alarm:

`EC2-High-Memory-Usage`

Threshold:

`80%`

Metric:

`mem_used_percent`

## CPU Alarm

Alarm:

`EC2-High-CPU-Usage`

Threshold:

`80%`

Metric:

`CPUUtilization`

## SNS Notifications

CloudWatch alarms are connected to an SNS topic:

`EC2-Monitoring-Alerts`

The SNS topic sends alarm notifications to the configured email subscription.

## Configuration

CloudWatch Agent configuration:

`cloudwatch/amazon-cloudwatch-agent.json`

## Verification

List memory metrics:

```bash
aws cloudwatch list-metrics \
  --namespace CWAgent \
  --metric-name mem_used_percent
