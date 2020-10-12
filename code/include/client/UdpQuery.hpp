/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** UdpQuery
*/

#ifndef CPP_UdpQuery_HPP
#define CPP_UdpQuery_HPP

#include <sstream>
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/serialization/vector.hpp>
#include <vector>
#include "Contact.hpp"

/**
 * @brief Represents a query that will be serialize then send through UDP sockets.
*/
class UdpQuery
{
public:
    /**
     * @brief The type of the query.
    */
    enum QueryType {
        START_CALL = 0,
        CONFIRM_CALL = 1,
        STOP_CALL = 2,
        CANCEL_CALL = 3,
        SEND_AUDIO = 4
    };
private:
    Contact _sender;
    std::vector<uint16_t> _data;
    QueryType _type;
public:
    int _id; // TEMPORARY

    QueryType getType() const;

    UdpQuery(QueryType type = QueryType::SEND_AUDIO,
             const Contact &sender = Contact("", "", -1), int id = 0);
    ~UdpQuery();

    const std::vector<uint16_t> &getData() const;
    void setData(const std::vector<uint16_t> &data);

    const Contact &getSender() const;

    void setSender(const Contact &sender);

    template<class Archive>
    void serialize(Archive& ar, const unsigned int version){
        ar & _sender & _data & _type & _id;
    }
};

std::string UdpSerializeQuery(const UdpQuery &query);
UdpQuery UdpDeserializeQuery(const std::string &query);

BOOST_CLASS_VERSION(UdpQuery, 2)

#endif
