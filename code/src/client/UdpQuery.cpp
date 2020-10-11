/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** UdpQuery
*/

#include "UdpQuery.hpp"

UdpQuery::UdpQuery(QueryType type, const Contact &sender, int id)
: _type(type), _sender(sender), _id(id) {}

UdpQuery::~UdpQuery() {}

const std::vector<uint16_t> &UdpQuery::getData() const
{
    return _data;
}

void UdpQuery::setData(const std::vector<uint16_t> &data)
{
    _data = data;
}

UdpQuery::QueryType UdpQuery::getType() const
{
    return _type;
}

const Contact &UdpQuery::getSender() const
{
    return _sender;
}

void UdpQuery::setSender(const Contact &sender)
{
    _sender = sender;
}

std::string UdpSerializeQuery(const UdpQuery &query)
{
    std::ostringstream archive_stream;
    boost::archive::text_oarchive archive(archive_stream);

    archive << query;
    return archive_stream.str();
}

UdpQuery UdpDeserializeQuery(const std::string &query)
{
    UdpQuery result;
    std::istringstream iss(query);
    boost::archive::text_iarchive archive(iss);

    archive >> result;
    return result;
}