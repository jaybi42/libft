/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isspace.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jguthert <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/04/16 18:04:58 by jguthert          #+#    #+#             */
/*   Updated: 2016/04/16 18:06:51 by jguthert         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int		ft_isspace(char c)
{
	return (c == ' ' || c == '\t' || c == '\n' || c == '\f' ||
			c == '\v' || c == '\r');
}