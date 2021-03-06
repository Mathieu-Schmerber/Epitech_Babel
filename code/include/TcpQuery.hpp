/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** TcpQuery
*/

#ifndef CPP_TcpQuery_HPP
#define CPP_TcpQuery_HPP

#include <sstream>
#include <boost/archive/text_iarchive.hpp>
#include <vector>
#include "Contact.hpp"

/**
 * @brief Represents a query that will be serialize then send through TCP sockets.
*/
class TcpQuery
{
    public:
        /**
         * @brief The type of the query.
        */
        enum QueryType {
            CONNECT = 0,
            CLIENT_LIST = 1,
            DISCONNECT = 2,
            DENIED = 3
        };
    private:
        std::vector<Contact> _data;
        QueryType _type;
	public:

    TcpQuery(QueryType type = QueryType::CLIENT_LIST);
		~TcpQuery();

		void addLine(Contact line);
		QueryType getType() const;
        std::vector<Contact> getData() const;
        void setData(const std::vector<Contact> &contact);

    template<class Archive>
        void serialize(Archive& ar, const unsigned int version){
            ar & _data & _type;
        }
};

std::string TcpSerializeQuery(const TcpQuery &query);
TcpQuery TcpDeserializeQuery(const std::string &query);

BOOST_CLASS_VERSION(TcpQuery, 2)

#endif
