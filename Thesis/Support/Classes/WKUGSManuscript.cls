% $Id: WKUGSManuscript.cls $
%
% Manuscript Class for a Thesis written in LaTeX for WKU Graduate Students
% Western Kentucky University
%
% Trevor D. Brown <trevor.brown593@topper.wku.edu>
%
% Adapted from:
% AlabamaManuscript.cls 17328 2011-07-07 01:11:59Z nkraft $
%
% Manuscript Class for an ETD
% Department of Computer Science
% The University of Alabama
%
% Nicholas A. Kraft <nkraft@cs.ua.edu>
%

\def\filedate{2024/08/12}
\def\fileversion{v1.2}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{./Support/WKUCSManuscript}[%
   \filedate \space \fileversion
   Manuscript Class for a WKU Graduate School Thesis.
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
    letterpaper,
    onecolumn,
    oneside,
    english
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
    style=apa,
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
\geometry{
   letterpaper,
   top=1in,
   left=1in,
   right=1in,
   bottom=1in
   % bindingoffset=0.5in
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
   {\centering\normalsize}{}{0pt}{}
\titleformat{name=\chapter,numberless}[display]
   {\centering\normalsize}{\vspace*{\baselineskip}}{0pt}{}
\titleformat{\section}[hang]
   {\centering\normalsize}{}{1em}{}
\titleformat{\subsection}[hang]
   {\centering\normalsize}{}{1em}{}
\titleformat{\subsubsection}[hang]
   {\centering\normalsize}{}{1em}{}
\titleformat{\paragraph}[runin]
   {\normalsize}{}{1em}{}
\titlespacing{\chapter}{0pt}{*0}{*0}
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

   \title{\ThesisTitle}
   \date{\ThesisDate}

   \newsavebox{\mylistingbox}
   \patchcmd{\epigraph}{\@epitext{#1}}{\itshape\@epitext{#1}}{}{}

   \cleardoublepage
   \phantomsection

   \vspace*{1.5in}

   \begin{center}
      \MakeUppercase{\ETD@title} \\
   \end{center}

   % Leave a blank line below, to start another paragraph.

   % The vertical measurement below may need to be adjusted to get the next bit of text 4 in. from the top of the page.
   \vspace*{1.25in}
   % Leave a blank line below, to start another paragraph.

   \begin{center}
      A Thesis submitted in partial fulfillment \\
      of the requirements for the degree \\
      Master of Science
   \end{center}
   % Leave a blank line below, to start another paragraph.

   % The vertical measurement below may need to be adjusted to get the next bit of text 7 in. from the top of the page.
   \vspace{1.2in}
   % Leave a blank line below, to start another paragraph.

   \begin{center}
      School of Engineering and Applied Sciences (SEAS) \\
      Western Kentucky University \\
      Bowling Green, Kentucky
   \end{center}
   % Leave a blank line below, to start another paragraph.

   % The vertical measurement below may need to be adjusted to get the next bit of text 9 in. from the top of the page.
   \vspace{1.2in}
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
   \phantomsection

   % \setlength{\parskip}{\baselineskip}
   \setlength{\parindent}{20pt}

   \begin{center}
      ABSTRACT
   \end{center}

   \begin{center}
        \MakeUppercase{\ETD@title}
    \end{center}

    \doublespacing
}{
    \clearpage
}

\newenvironment{tables}{
    \newpage
}

\newenvironment{figures}{
    \newpage
}

\newenvironment{abbreviations}{
    \newpage
}

\newenvironment{toc}{}{}

%---- Dedication
\newenvironment{dedication}{%
   \phantomsection
   \vspace*{1.5in}
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
   % \vspace*{0.5in}
   % \vspace*{\baselineskip}
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
   % \vspace*{0.5in}
   % \vspace*{\baselineskip}
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
      \@dottedtocline{1}{0em}{1.4em}{#1}{#2}
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
   % \vspace*{0.5in}
   % \vspace*{\baselineskip}
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
   % \vspace*{0.5in}
   % \vspace*{\baselineskip}
   \begin{center}
      LIST OF FIGURES
   \end{center}
   \vspace{-\baselineskip}
   \begin{spacing}{1.0}
      \@starttoc{lof}
   \end{spacing}
   \cleardoublepage
}

%---- List of Abbreviations
\newcommand{\listofabbreviations}{%
   \phantomsection
   \addcontentsline{toc}{chapter}{List of Abbreviations}
   \begin{center}
      LIST OF ABBREVIATIONS
   \end{center}
   \begingroup
      \let\clearpage\relax
      \renewcommand{\glossarypreamble}{\vspace{-3.5\baselineskip}} % Reduces space before glossary list
      % \setlength{\glslistdottedwidth}{0pt} % Ensures no extra spacing due to dotted lines
      \begin{spacing}{1.5}
         % Print the defined Abbreviations.
            \printglossary[title={},toctitle={},type=\acronymtype] % toctitle={List of Abbreviations},
      \end{spacing}
   \endgroup
   \cleardoublepage
}

  %---- List of Algorithms
  \renewcommand{\listofalgorithms}{%
  \phantomsection
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
  \gdef\chapter{\@Alph\c@chapter}
  \renewcommand{\appendixtocname}{Appendix}
  \addappheadtotoc
  \newpage
  }

%-- Body
%--

\newenvironment{body}{%
   \setcounter{page}{1}
   \pagenumbering{arabic}

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

\renewcommand{\cite}[1]{\citep{#1}}
\newcommand{\shortcite}[1]{\citeyearpar{#1}}

\newenvironment{singlespacecode}{\singlespacing}{\par}

\newcommand{\appendixtitleformat}{%
   \titleformat
      {\chapter} % Modify chapter format
      [display]
      {\centering} % Styling: centered.
      {APPENDIX \thechapter} % Label format: "APPENDIX X"
      {0pt} % Extra space before the title
      {} % Space between the label and the title
}
