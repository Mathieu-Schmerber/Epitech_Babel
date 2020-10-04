/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** TcpQuery
*/

#include "TcpQuery.hpp"

TcpQuery::TcpQuery(QueryType type) : _type(type)
{
}

TcpQuery::~TcpQuery() {}

void TcpQuery::addLine(Contact line)
{
    this->_data.push_back(line);
}

std::vector<Contact> TcpQuery::getData() const
{
    return this->_data;
}

TcpQuery::QueryType TcpQuery::getType() const
{
    return this->_type;
}

std::string TcpSerializeQuery(const TcpQuery &query)
{
    std::ostringstream archive_stream;
    boost::archive::text_oarchive archive(archive_stream);

    archive << query;
    return archive_stream.str();
}

TcpQuery TcpDeserializeQuery(std::string query)
{
    TcpQuery result;
    std::istringstream iss(query);
    boost::archive::text_iarchive archive(iss);

    archive >> result;
    return result;
}