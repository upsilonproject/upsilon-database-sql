%include SPECS/.buildid.rpmmacro

Name:		upsilon-database-sql
Version:	%{version_formatted_short}
Release:	%{timestamp}.%{?dist}
Summary:	Upsilon Databases SQL
BuildArch:	noarch

Group:		Applications/System
License:	GPLv2
URL:		http://www.upsilonproject.io
Source0:	upsilon-database-sql.zip

BuildRequires:	bash
Requires:	bash mysql

%description
Upsilon SQL Databases

%prep
%setup -q -n upsilon-database-sql-%{tag}

%build

%install
mkdir -p %{buildroot}/usr/share/upsilon-database-sql/mysql
cp -r mysql/* %{buildroot}/usr/share/upsilon-database-sql/mysql

%files
/usr/share/upsilon-database-sql/*

%changelog
* Thu Oct 26 2017 James Read <contact@jread.com> 1.0.0-1
	Version 1.0.0
