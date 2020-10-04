/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Contact
*/

#ifndef CPP_Contact_HPP
#define CPP_Contact_HPP

#include <string>
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/serialization/vector.hpp>

class Contact
{
	private:
        std::string _ip;
        std::string _name;
        int _port;

	public:
        Contact(const std::string &ip = "null",
                const std::string &name = "null",
                int port = -1);
        ~Contact() = default;

    template<class Archive>
    void serialize(Archive& ar, const unsigned int version){
        ar & _ip & _name & _port;
    }


    std::string getName() const;
    std::string getIp() const;
    int getPort() const;
};

BOOST_CLASS_VERSION(Contact, 2)

#endif
