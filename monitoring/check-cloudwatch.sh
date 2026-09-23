#!/bin/bash

echo "======================================"
echo " AWS CloudWatch Monitoring Check"
echo "======================================"

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

echo "Instance ID: $INSTANCE_ID"
echo ""

echo "CloudWatch Memory Metric:"
aws cloudwatch list-metrics \
  --namespace CWAgent \
  --metric-name mem_used_percent \
  --dimensions Name=InstanceId,Value=$INSTANCE_ID \
  --output table

echo ""
echo "CloudWatch Alarms:"
aws cloudwatch describe-alarms \
  --alarm-names EC2-High-Memory-Usage EC2-High-CPU-Usage \
  --query 'MetricAlarms[*].[AlarmName,StateValue,MetricName,Threshold]' \
  --output table

