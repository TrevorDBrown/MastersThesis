% $Id: WKUCSManuscript.cls $
%
% Manuscript Class for a Thesis written in TeX for WKU CS Graduate Students
% School of Engineering and Applied Sciences (SEAS), Computer Science Program
% Western Kentucky University
%
% Trevor D. Brown <trevor.brown593@topper.wku.edu>
%
% Adapted from: AlabamaManuscript.cls 17328 2011-07-07 01:11:59Z nkraft $
%
% Manuscript Class for an ETD
% Department of Computer Science
% The University of Alabama
%
% Nicholas A. Kraft <nkraft@cs.ua.edu>

\def\filedate{2024/08/12}
\def\fileversion{v1.1}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{./Support/WKUCSManuscript}[%
   \filedate \space \fileversion
   Manuscript Class for a WKU CS Thesis
   ]

%-- Variable declaration/initialization
%--

%---- Public variables1
\renewcommand{\title}[1]{\gdef\ETD@title{#1}}
\renewcommand{\author}[1]{\gdef\ETD@author{#1}}
\renewcommand{\date}[1]{\gdef\ETD@date{#1}}
\newcommand{\department}[1]{\gdef\ETD@department{#1}}

\title{---}
\author{---}
\date{---}
\department{---}

\newcommand{\SignatureLine}{
   \makebox[2.75in]{\hrulefill} \\
}

\newcommand{\LongSignatureLine}{
   \makebox[4in]{\hrulefill} \\
}

\newcommand{\DateLine}{
   \makebox[1.3in]{\hrulefill}
}

\newcommand{\ThesisCommitteeChair}{Committee Chair}
\newcommand{\ThesisCommitteeMember}{Committee Member}

%---- Private variables
\newcommand{\ETD@draft}{false}


%-- Document Options
%--
\DeclareOption{draft}{%
   \PassOptionsToClass{draft}{report}
   \PassOptionsToPackage{final}{graphicx}
   \PassOptionsToPackage{final}{hyperref}
   \PassOptionsToPackage{final}{listings}
   \renewcommand{\ETD@draft}{true}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass[
    12pt,
    % letterpaper, % letterpaper no longer needed... maybe...
    onecolumn,
    oneside
]{report}

%-- Packages
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\usepackage{fmtcount}
%--

%---- fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{mathptmx}              % roman
\RequirePackage[scaled=0.92]{helvet}   % sans serif
\RequirePackage{courier}               % typewriter
\RequirePackage{pifont}                % Zapf Dingbats

%---- other
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage[strict]{changepage}
\RequirePackage{comment}
\RequirePackage[pdftex,dvipsnames]{color}
\RequirePackage{fancyhdr}
\RequirePackage[bottom,hang,stable]{footmisc}
\RequirePackage[pdftex]{geometry}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{ifthen}
\RequirePackage{indentfirst}
\RequirePackage{lineno}
\RequirePackage{lipsum}
\RequirePackage{listings}
% \RequirePackage[square,longnamesfirst,sort&compress]{natbib}
\RequirePackage[
    backend=biber,
    style=numeric,
    sorting=none,
    natbib=true
]{biblatex}
\RequirePackage{setspace}
\RequirePackage[caption=false]{subfig}
\RequirePackage{titlesec}
%\RequirePackage[subfigure]{tocloft}
\RequirePackage{ulem}
\RequirePackage[
,  pdftex
,  colorlinks
,  hyperfootnotes
,  linktocpage
,  citecolor=black
,  linkcolor=black
,  urlcolor=black
]{hyperref}


%-- Package Configuration
%--

%---- geometry
% \geometry{letterpaper}        % letterpaper no longer needed... maybe...
% \geometry{textwidth=6.5in}    % Dimension no longer needed... maybe...
% \geometry{textheight=9in}     % Dimension no longer needed... maybe...
\geometry{
   letterpaper,
   top=1in,
   left=1in,
   right=1in,
   bottom=1in
}
% Note: may need to include "bindingoffset=0.5in", when submitting for bindery service. TODO: Verify first.

%---- fancyhdr
\fancyhf{}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%---- lineno
\renewcommand{\linenumberfont}{\normalfont\scriptsize\sffamily}
\setlength{\linenumbersep}{2em}

%---- titlesec
\titleformat{\chapter}[display]
   {\centering\normalsize\bfseries}{\vspace*{0.5\baselineskip}\@chapapp\space\Numberstring{chapter}}{0pt}{\MakeUppercase}
\titleformat{name=\chapter,numberless}[display]
   {\centering\normalsize}{\vspace*{\baselineskip}}{0pt}{\MakeUppercase}
\titleformat{\section}[hang]
   {\centering\normalsize\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}[hang]
   {\normalsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]
   {\itshape\normalsize}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]
   {\itshape\normalsize}{\theparagraph}{1em}{}
\titlespacing{\chapter}{0pt}{.5in}{*0}
\titlespacing{\section}{0pt}{*0}{*0}
\titlespacing{\subsection}{0pt}{*0}{*0}
\titlespacing{\subsubsection}{0pt}{*0}{*0}
\titlespacing{\paragraph}{0pt}{*0}{2em}

%---- ulem
\normalem

%-- Document properties
%--

\AtBeginDocument{%
   \setlength{\footnotemargin}{1em}
   \setlength{\parindent}{0.5in}
   \setcounter{tocdepth}{2}
   \setcounter{secnumdepth}{3}
   \pagestyle{fancy}
   \pagenumbering{roman}
   \widowpenalty=10000
   \clubpenalty=10000
}

\author{\ThesisAuthor}

%-- Preliminary pages

%--

%---- Blank page left intentionally

%---- Blank page
% First Fly Sheet, not considered in numbering.
\newcommand{\IntentionallyBlankPage}{
   \newpage
   \thispagestyle{empty}
   \phantom{}

   \addtocounter{page}{-1}    % Decrement the page counter.
}


%---- Title page and copyright page
\renewcommand{\maketitle}[1]{%
   \newpage
   \thispagestyle{empty}
   \setlength\epigraphwidth{\textwidth}
   \setlength\epigraphrule{0pt}
   \BeforeBeginEnvironment{lstlisting}{\begin{singlespace}}
   \AfterEndEnvironment{lstlisting}{\end{singlespace}\noindent\ignorespaces}

   \title{\ThesisTitle}
   \date{\ThesisDate}

   \newsavebox{\mylistingbox}
   \patchcmd{\epigraph}{\@epitext{#1}}{\itshape\@epitext{#1}}{}{}

   \cleardoublepage
   \phantomsection
   \vspace{2in}

   \begin{center}
      \MakeUppercase{\ETD@title} \\
   \end{center}

   % Leave a blank line below, to start another paragraph.

   % The vertical measurement below may need to be adjusted to get the next bit of text 4 in. from the top of the page.
   \vspace{2in}
   % Leave a blank line below, to start another paragraph.

   \begin{center}
      A Thesis submitted in partial fulfillment \\
      of the requirements for the degree \\
      Master of Science
   \end{center}
   % Leave a blank line below, to start another paragraph.

   % The vertical measurement below may need to be adjusted to get the next bit of text 7 in. from the top of the page.
   \vspace{2in}
   % Leave a blank line below, to start another paragraph.

   \begin{center}
      School of Engineering and Applied Sciences (SEAS) \\
      Western Kentucky University \\
      Bowling Green, Kentucky
   \end{center}
   % Leave a blank line below, to start another paragraph.

   % The vertical measurement below may need to be adjusted to get the next bit of text 9 in. from the top of the page.
   \vspace{2in}
   % Leave a blank line below, to start another paragraph.

   \begin{center}
      By \\
      \ETD@author \\ 			%remove "MakeUppercase" to have case sensitive names
      \doublespacing
      \ETD@date
   \end{center}

}

%-------- Signatures page
\newenvironment{signatures}{
   \newpage
   \thispagestyle{empty}
}{}

%-------- References pages
\newenvironment{references}{
   \newpage
}{}

  %---- Abstract
\renewenvironment{abstract}{%

   \setlength{\parskip}{\baselineskip}
   \setlength{\parindent}{20pt}

   \begin{center}
      ABSTRACT
   \end{center}

   \begin{center}
        \MakeUppercase{\ETD@title}
    \end{center}

   %  \doublespacing

   %  \begin{center}
   %      %Month Year
   %      \ETD@date
   %  \end{center}

   %  \vspace{-3em}													% changed to -3 to be in the same line as author

   %  {\raggedright \ETD@author}

   %  \vspace{-2em}

   %  {\raggedleft \hfill \PageCount\ Pages}  % Replace XX with the number of pages.		% replace with newer page

   %  {\raggedright Directed by: \ThesisCommitteeChairOne,\ \ThesisCommitteeMemberOne,\ \ThesisCommitteeMemberTwo,\ and\ \ThesisCommitteeMemberThree }

   %  {\raggedright \AcademicDepartment}

   %  {\vspace{-2em}}
   %  {\raggedleft \hfill \AcademicInstitution} \\

   %  {\par}
}{
    \clearpage
}

\newenvironment{tables}{
    \newpage
}

\newenvironment{figures}{
    \newpage
}

\newenvironment{symbols}{
    \newpage
}

\newenvironment{toc}{}{}

%---- Dedication
\newenvironment{dedication}{%
   \phantomsection
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      DEDICATION
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{2.0}
}{%
   \end{spacing}
   \cleardoublepage
   %\changepage{1in}{0in}{0in}{0in}{0in}{-1in}{0in}{0in}{0in}
}
%---- Acknowledgments
\newenvironment{acknowledgments}{%
   \phantomsection
   % \addcontentsline{toc}{chapter}{ACKNOWLEDGMENTS}				%commented to remove from table of content
   %\changepage{-1in}{0in}{0in}{0in}{0in}{1in}{0in}{0in}{0in}
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      ACKNOWLEDGMENTS
   \end{center}
   \setlength{\parskip}{\baselineskip}
   \setlength{\parindent}{20pt}
   \vspace{-\baselineskip}
   \begin{spacing}{2.0}
}{%
   \end{spacing}
   \cleardoublepage
   %\changepage{1in}{0in}{0in}{0in}{0in}{-1in}{0in}{0in}{0in}
}

%---- Table of Contents
\renewcommand{\tableofcontents}{%
   %\pagestyle{toccont}
   %\thispagestyle{tocstart}
   \phantomsection
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      TABLE OF CONTENTS
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{1.0}
      \@starttoc{toc}
   \end{spacing}
   \cleardoublepage
   %\pagestyle{fancy}
   %\thispagestyle{fancy}
}

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \leavevmode
      \@dottedtocline{1}{0em}{1.4em}{\MakeUppercase{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \leavevmode
      \@dottedtocline{1}{1.5em}{2.3em}{{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@subsection[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \leavevmode
      \@dottedtocline{2}{3.8em}{3.2em}{{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}

\renewcommand*\l@figure[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \leavevmode
      \@dottedtocline{1}{1.5em}{2.3em}{{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}
\let\l@table\l@figure
\def\ps@tocstart{
   \setlength{\topmargin}{0.5in}
}
\def\ps@toccont{
   \setlength{\topmargin}{-0.5in}

}

%---- List of Tables
\renewcommand{\listoftables}{%
   \phantomsection
   \addcontentsline{toc}{chapter}{List of Tables}
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      LIST OF TABLES
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{1.0}
      \@starttoc{lot}
   \end{spacing}
   \cleardoublepage
}

%---- List of Figures
\renewcommand{\listoffigures}{%
   \phantomsection
   \addcontentsline{toc}{chapter}{List of Figures}
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      LIST OF FIGURES
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{1.0}
      \@starttoc{lof}
   \end{spacing}
   \cleardoublepage
}

%---- List of Symbols/Abbreviations
\newcommand{\listofsymbols}{%
   \phantomsection
   \addcontentsline{toc}{chapter}{List of Abbreviations}
   \vspace*{0.5in}
   \vspace*{\baselineskip}
   \begin{center}
      LIST OF ABBREVIATIONS
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{1.0}
      \input{./Sections/Abbreviations.tex}
   \end{spacing}
   \cleardoublepage
}

  %---- List of Algorithms

  \renewcommand{\listofalgorithms}{%
  \phantomsection
%\addcontentsline{toc}{chapter}{LIST OF ALGORITHMS}				%commented to remove from table of content
  \vspace*{0.5in}
  \vspace*{\baselineskip}
  \begin{center}
     LIST OF ALGORITHMS
  \end{center}
  \vspace{-\baselineskip}
  \begin{spacing}{1.0}
     \@starttoc{tocloft}
  \end{spacing}
  \cleardoublepage
}

\def\@chapter[#1]#2{
    \ifnum \c@secnumdepth >\m@ne
         \refstepcounter{chapter}%
         \typeout{\@chapapp\space\thechapter.}%
         \addcontentsline{toc}{chapter}%
                   {\protect\numberline{\thechapter}#1}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi

    \chaptermark{#1}%
    \if@twocolumn
      \@topnewpage[\@makechapterhead{#2}]%
    \else
      \@makechapterhead{#2}%
      \@afterheading
    \fi

}

\renewcommand\appendix{\par
  \cleardoublepage
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \setcounter{table}{0}
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
  \renewcommand{\thetable}{A.\arabic{table}}
  \renewcommand{\appendixtocname}{Appendix}
  \addappheadtotoc
  \newpage
  }

%-- Body
%--

\newenvironment{body}{%
   \setcounter{page}{1}
   \pagenumbering{arabic}

   \setlength{\parskip}{\baselineskip}
   \setlength{\parindent}{20pt}

   \begin{spacing}{2.0}
      \ifthenelse{\equal{\ETD@draft}{true}}{%
         \begin{linenumbers}
      }{}
}{%
      \ifthenelse{\equal{\ETD@draft}{true}}{%
         \end{linenumbers}
      }{}
   \end{spacing}
   \cleardoublepage
}

\newcommand{\newtocpage}{%
   \addtocontents{toc}{\protect\newpage\protect\vspace*{-2\baselineskip}}
}

%---- References
% \renewenvironment{thebibliography}[1]{%
% 	\phantomsection
% 	\addcontentsline{toc}{chapter}{REFERENCES}
% 	\cleardoublepage
%   %\changepage{-1in}{0in}{0in}{0in}{0in}{1in}{0in}{0in}{0in}
%   \vspace*{0.5in}
%   \vspace*{\baselineskip}
%   \begin{center}
%       REFERENCES
%   \end{center}
%   %\vspace{-.75\baselineskip}
%   \vspace{-.5\baselineskip}
%   \list{%
%       [\arabic{enumi}]
%   }{%
%       \settowidth\labelwidth{[#1]}
%       \itemsep\baselineskip
%       \leftmargin\labelwidth
%       \advance\leftmargin\labelsep
%       \advance\leftmargin\bibindent
%       \itemindent -\bibindent
%       \listparindent \itemindent
%       \parsep \z@
%       \usecounter{enumi}
%   }
%   \def\newblock{}
%   \sloppy
%   \sfcode`\.=1000\relax
% }{%
% 	\cleardoublepage
%   %\changepage{1in}{0in}{0in}{0in}{0in}{-1in}{0in}{0in}{0in}
% }

\renewcommand{\cite}[1]{\citep{#1}}
\newcommand{\shortcite}[1]{\citeyearpar{#1}}

