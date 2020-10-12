/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtStyle
*/

#ifndef CPP_QtStyle_HPP
#define CPP_QtStyle_HPP

#include <string>

/**
 * @brief A namespace containing the interface styles.
*/
namespace QtStyle {

    const QString inputStyle = QString(
            "text-align:left; background: #72767c;"
            "color: 'white'; font-size: 15px;"
            "border-radius: 25px; padding: 5px;");

    const QString labelStyle = QString(
            "color: 'white'; font-size: 15px;");

    const QString titleStyle = QString(
            "color: 'white'");

    const QString buttonStyle = QString(
            "text-align:left; background: #505d84;"
            "color: 'white'; font-size: 15px;"
            "border-radius: 25px; padding: 10px;");
};

#endif
