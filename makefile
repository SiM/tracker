###
### Makefile
### Login : <el-indio@el-indio.sad-hill>
### Started on Sun May 24 13:52:40 2009 el-indio
### $Id$
###
### Copyright (C) 2009 el-indio
### This program is free software; you can redistribute it and/or modify
### it under the terms of the GNU General Public License as published by
### the Free Software Foundation; either version 2 of the License, or
### (at your option) any later version.
###
### This program is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
### GNU General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with this program; if not, write to the Free Software
### Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
###
#
###############################
## Complete this to make it ! #
###############################
NAME =ECHO_CLIENT # Name of executable file
CORBA = corba
SRC_CLIENT = client.cpp # List of *.c++
SRC_CORBA = echo.cpp Echo_i.cpp client.cpp Echo_i.h
INCL = echo.h
SRC_IDL = echo.idl
################
# Optional add #
################
IPATH = #-I. path of include file
OBJOPT = -Wall -g -lomnithread -lomniORB4 # option for obj
EXEOPT = -Wall -g -lomnithread -lomniORB4 # option for exe (-lefence ...)
CORBFLAGS = -bcxx -Wbh=.h -Wbs=.cpp 
LPATH = #-L. path for librairies ...
 
#####################
# Macro Definitions #
#####################
CC = gcc
CXX = g++
IDL = omniidl
OBJS = $(SRC_CLIENT:.cpp=.o) # WARNING!!! Be careful of your file extensions.
CORBJS = $(SRC_CORBA:.cpp=.o)
RM = rm -f
STRIP = strip
 
CFLAGS = $(OBJOPT) $(IPATH)
LDFLAGS = $(EXEOPT) $(LPATH)
BUILD = $(SRC_CORBA) $(INCL)
 
.SUFFIXES: .h .cpp .o .idl
 
##############################
# Basic Compile Instructions #
##############################
 
all: $(CORBA)
 
$(BUILD) : $(SRC_IDL)
	$(IDL) $(CORBFLAGS) $(SRC_IDL)
 
$(CORBA) : $(CORBJS) $(BUILD)
	$(CXX) $(CORBJS) $(LDFLAGS) -o $(CORBA)
 
#$(NAME): $(OBJS) $(SRC_CLIENT) $(INCL)
#	$(CXX) $(OBJS) $(LDFLAGS) -o $(NAME)
 
# main.o : $(INCL_CLIENT)
 
%.o: %.cpp
	$(CXX) $(CFLAGS)-o $@ -c $<
 
.PHONY: clean fclean
 
clean:
# indent -kr $(SRC_CLIENT) $(INCL_CLIENT)
	$(RM) $(OBJS) *~
 
fclean:
	$(RM) $(NAME) $(CORBA)
 
 
################
# Dependencies #
################
 
 
 
# $@ Le nom de la cible
# $< Le nom de la première dépendance
# $^ La liste des dépendances
# $? La liste des dépendances plus récentes que la cible
# $* Le nom du fichier sans suffixe
