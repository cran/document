\name{NEWS}
\title{NEWS}

\section{Changes in version 4.0.0.9000}{
\itemize{
\item FIXME
}
}

\section{Changes in version 4.0.0}{
\itemize{
\item Removed examples for internal functions from the internal documentation (as
requested by CRAN).
\item Fixed broken links in README.Rmd and DESCRIPTION.
\item Moved \code{get_lines_between_tags()} to package \emph{fritools}.
}
}

\section{Changes in version 3.3.4}{
\itemize{
\item Using suggested packages conditionally only.
}
}

\section{Changes in version 3.3.3}{
\itemize{
\item Fixed test for html output failing on CRAN.
}
}

\section{Changes in version 3.3.2}{
\itemize{
\item Fixed failing test for html output.
}
}

\section{Changes in version 3.3.1}{
\itemize{
\item Fixed failing tests on CRAN:
\code{callr::rcmd_safe} calls \verb{R CMD Rdconv --type=txt} mysteriously fail
(it cuts examples off), so we now test against \code{--type=html},
which keeps working.
We now use \code{tools::Rd2txt} instead of \code{callr::rcmd_safe}.
\item Now importing package \code{fritools}, where the functions from 3.3.0 now live.
}
}

\section{Changes in version 3.3.0}{
\itemize{
\item Fixed failing test on r-patched-solaris-x86 by adding and exporting test
helper functions \code{is_running_on_fvafrcu_machines()},
\code{is_running_on_gitlab_com()}, \code{set_RUN_R_TESTS()} and
`get_RUN_R_TESTS()'. The docs of which are internal.
}
}

\section{Changes in version 3.2.0}{
\itemize{
\item Tagged docs for \code{get_dpd()} and \code{get_lines_between_tags()} as internal.
\item README.Rmd now links to gitlab.com
}
}

\section{Changes in version 3.1.0}{
\itemize{
\item Now deleting tagged lines only if there are any.
}
}

\section{Changes in version 3.0.2}{
\itemize{
\item Patched failing "CRAN Package Check Results for Package document".
\item Skipping most tests on CRAN.
}
}

\section{Changes in version 3.0.0}{
\itemize{
\item Added a fix to make the evaluation of whether or not/how we pass R CMD check
more stable by using rcmdcheck internally.
This causes the \code{check_result}-item of the list returned by document() to
change: it is now the return value of rcmdcheck::rcmdcheck() instead of the
return value of callr::rcmd_safe("check", ...).
\item The (internal) functions
\itemize{
\item \emph{is_Rd_file}
\item \emph{display_Rd}
\item \emph{fake_package}
\item \emph{check_package}
\item \emph{sort_unlocale}
\item \emph{alter_description_file}
\item \emph{Rd_txt_RUnit}
are not exported any longer.
}
}
}

\section{Changes in version 2.2.1}{
\itemize{
\item Fixed internal file parsing.
\item Exported function get_lines_between_tags().
}
}

\section{Changes in version 2.2.0}{
\itemize{
\item Marked \emph{alter_descprition_file()} as deprecated, please use CRAN package
\code{desc} by Gabor Csardi instead.
Internally, \emph{alter_descprition_file()} is not used any longer.
It just lingers as it was exported in version 2.1.0.
\item \emph{alter_descprition_file()} now keeps whitespace, making it possible to pass
newline characters, for example for the Authors@R field.
}
}

\section{Changes in version 2.1.0}{
\itemize{
\item Fix \emph{man()} to now work with RStudio.
\item Add and export a new function \emph{alter_description_file()}.
It serves as a replacement for the internal
\emph{add_depenedencies_to_description()}, and straightens the former internal
\emph{clean_descprition()} which used \link{*write|read}Lines()* instead of
\link{*write|read}.dcf()* and is now exported as \emph{clean_descprition_file()}.
}
}

\section{Changes in version 2.0.0}{
\itemize{
\item \emph{document()} now throws an error if the temporary package does not pass R CMD
check without errors, warnings or notes.
\itemize{
\item Added argument 'stop_on_check_not_passing'. Set to FALSE to issue a
\emph{warning()} instead of throwing an error.
\item Added argument 'check_as_cran' to use the --as-cran flag with R CMD check,
\emph{document()} then assumes a single NOTE (on the CRAN incoming feasibility)
to be okay.
}
}
}

\section{Changes in version 1.2.1}{
\itemize{
\item Check for RStudio in \emph{man()}.
\item Fix return status of \emph{write_the_docs()}.
}
}

\section{Changes in version 1.2.0}{
\itemize{
\item Enhance documenation.
}
}

\section{Changes in version 1.1.0}{
\itemize{
\item Use the input file's basename instead of the temporary package's name as
basename for the output files.
\item Only return output file paths if the according file exists.
}
}

\section{Changes in version 1.0.0}{
\itemize{
\item First release. See https://github.com/fvafrCU/document for any changes before.
}
}

