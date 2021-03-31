Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04DB34A957
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Mar 2021 15:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhCZOMN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Mar 2021 10:12:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229986AbhCZOMK (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Mar 2021 10:12:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3610061A02;
        Fri, 26 Mar 2021 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616767929;
        bh=dNtp5Lk+sXW82yd48pelyEyjW5yjUsssA7DFylEmuLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fn7DSFHS3yMmhMAxVGz2owWcH9UTzABGUdycSuUGVI97ByV7+kVg/yckeuv35Lt7e
         cv+5S5tvgWEuIQoSnN4jeQZWN5WrNGv3dgPSbk0wG9HiB4yTZCb1cpTSWIPa9YP8q2
         sjMem1eA+dIs2chvYQ56Ej8OauQsXcmxKoNwZ3X4=
Date:   Fri, 26 Mar 2021 15:12:07 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Carlis <zhangxuezhi3@gmail.com>
Cc:     zhangxuezhi1@yulong.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: change '16 bit' to '16-bit'
Message-ID: <YF3rt28vKzt7CDIh@kroah.com>
References: <1616767770-70063-1-git-send-email-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616767770-70063-1-git-send-email-zhangxuezhi3@gmail.com>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Mar 26, 2021 at 10:09:30PM +0800, Carlis wrote:
> From: "carlis.zhang_cp" <zhangxuezhi1@yulong.com>
> 
> Change '16 bit' to '16-bit' for a same style.

Why?  This is up to the author.

> 
> Signed-off-by: carlis.zhang_cp <zhangxuezhi1@yulong.com>

Please use a real name, not an email-alias as a name.

thanks,

greg k-h
