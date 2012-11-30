%
% File Name:	ps.tex
% Author:	Aditya Ramesh
% Date:		12/29/2012
% Contact:	_@adityaramesh.com
%
% Introduction
%
% This class file, an extension of the article class, is used to typeset problem
% sets for courses. A heading is inserted at the top of the page that includes
% the following information: the problem set number, course title, student name,
% and student email. Additionally, an environment is provided that automatically
% numbers problems, using the following format:
%
%	Exercise {major number}.{problem number}.
%
% A fixed amount of vertical spacing is automatically inserted after each
% exercise. The font is set to Crimson (designed by Sebastian Koch) by default.
% Some frequently-used packages for typesetting mathematics and producing
% tables, enumerated lists, and a few other environments, are also included. For
% a user guide and more detailed documentation, please consult the file
% README.md.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ps}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass{article}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{enumerate}
\RequirePackage{fontspec}
\RequirePackage{mathtools}
\RequirePackage{siunitx}

\setmainfont[
	Path           = /Users/aditya/Library/Fonts/,
	Extension      = .otf,
	Ligatures      = TeX,
	Scale          = MatchLowercase,
	BoldFont       = Crimson-Bold,
	ItalicFont     = Crimson-Italic,
	BoldItalicFont = Crimson-BoldItalic
]{Crimson-Roman}

\makeatletter

\newcommand\coursename[1]{\renewcommand\@coursename{#1}}
\newcommand\@coursename{%
	\ClassError{ps}{No course name specified.}
	{Did you use the \noexpand\coursename command?}
}

\newcommand\coursetitle[1]{\renewcommand\@coursetitle{#1}}
\newcommand\@coursetitle{%
	\ClassError{ps}{No course title specified.}
	{Did you use the \noexpand\coursetitle command?}
}

\newcommand\problemset[1]{\renewcommand\@problemset{#1}}
\newcommand\@problemset{%
	\ClassError{ps}{No problem set number specified.}
	{Did you use the \noexpand\problemset command?}
}

\renewcommand{\maketitle}{%
	\begin{center}
	\LARGE
	\@coursetitle \\
	\@coursename \\
	\medskip
	\large
	\begin{tabular}{p{2in}@{\hspace{0.2in}}p{2in}}
	\raggedleft \hspace{0.05in} Problem Set \@problemset &
	\raggedright \@author \hspace{0.05in}
	\end{tabular}
	\end{center}
	\bigskip
}

\newcounter{@problemcounter}
\setcounter{@problemcounter}{1}
\newcommand\@majornumber{\@problemset.}

\newcommand\setmajornumber[1]{
	\renewcommand\@majornumber{#1.}
	\setcounter{@problemcounter}{1}
}

\newcommand\disablemajornumbering{%
	\renewcommand\@majornumber{}
	\setcounter{@problemcounter}{1}
}

\newenvironment{problem}[1][]{%
	\ifx\newenvironment#1\newenvironment
	\else
		\setcounter{@problemcounter}{#1}
	\fi
	\noindent\textbf{Exercise \@majornumber\arabic{@problemcounter}.}
	\stepcounter{@problemcounter}
}{\medskip}

\newenvironment{solution}{\noindent\textit{Solution.}}{\medskip}

\makeatother
\endinput