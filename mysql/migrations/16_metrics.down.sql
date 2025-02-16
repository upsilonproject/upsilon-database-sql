alter table service_metrics drop extracted;
alter table service_metrics drop updated;
alter table service_metrics drop serviceCheckResultId;
alter table service_metrics rename column serviceIdentifier to service;
