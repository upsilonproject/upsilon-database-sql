ALTER TABLE service_metrics ADD CONSTRAINT UNIQUE one_metric_per_service (serviceIdentifier, name);
