alter table service_metrics add extracted datetime not null;
alter table service_metrics add updated datetime not null;
alter table service_metrics add serviceCheckResultId int not null;
alter table service_metrics rename column service to serviceIdentifier;

