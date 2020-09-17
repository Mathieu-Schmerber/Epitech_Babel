/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** ArgParser
*/

#ifndef CPP_ArgParser_HPP
#define CPP_ArgParser_HPP

#include <string>

class ArgParser
{
	private:
        int _ac;
        char **_av;
	public:
		ArgParser(int ac, char **av);
		~ArgParser();

		bool isValid() const;
		bool isUsage() const;
		char **getAV() const;
		int getAC() const;
		std::pair<std::string, int> getParsedArgs() const;
};

#endif
