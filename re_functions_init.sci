printf("Initialising functions.\n");

LibraryFolder=get_absolute_file_path('re_functions_init.sci');

exec(LibraryFolder + "findallpeaks.sci");
exec(LibraryFolder + "FindInterestingPeaks.sci");
exec(LibraryFolder + "FindMaxPeaks.sci");
exec(LibraryFolder + "findpeaks.sci");
exec(LibraryFolder + "JaggedCombine.sci");
exec(LibraryFolder + "movingaverage.sci");
exec(LibraryFolder + "OverlayMeasurementArea.sci");
exec(LibraryFolder + "ReadSpectralEnginesData.sci");
exec(LibraryFolder + "ChangeAxisLabels.sci");
exec(LibraryFolder + "ReadSEFileSubtractBG.sci");
exec(LibraryFolder + "moving_average_matrix.sci");
exec(LibraryFolder + "time_since_epoch.sci");
exec(LibraryFolder + "read_sql_data.sci");
exec(LibraryFolder + "plot_both_se_files.sci");
exec(LibraryFolder + "plot_se_files_and_ref.sci");
exec(LibraryFolder + "make_file_name_valid.sci");
exec(LibraryFolder + "convert_timestr_to_epoch.sci");
exec(LibraryFolder + "find_csvs_in_dir.sci");
exec(LibraryFolder + "read_file_for_combining.sci");



//exec(LibraryFolder + "");
//exec(LibraryFolder + "");
//exec(LibraryFolder + "");
//exec(LibraryFolder + "");
//exec(LibraryFolder + "");
//exec(LibraryFolder + "");
//exec(LibraryFolder + "");
//exec(LibraryFolder + "");

