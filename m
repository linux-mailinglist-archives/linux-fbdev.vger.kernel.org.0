Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28394149993
	for <lists+linux-fbdev@lfdr.de>; Sun, 26 Jan 2020 08:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgAZHnQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 26 Jan 2020 02:43:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:48642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbgAZHnP (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 26 Jan 2020 02:43:15 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F5A120842;
        Sun, 26 Jan 2020 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580024594;
        bh=CHQkFKUOmA5YtxD0wl33gMO4LhTAp+CGsnM+wPrpj4g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sv8cfWWrjgWlhTkSLAseYHSMMz5heUhQH7G8yEWDDNSrAyjHsTZt046fLNytyWlGC
         5ablhIqnxhtetOADvRZsOgnLesHwFhFcxPJmFCWVBjuvLeLiEZBgFFyU9lbfZDgHlQ
         VlZFT0ZK4sDWcVqqvNL8mjszgVRWM4culvdiHriI=
Date:   Sun, 26 Jan 2020 08:17:24 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rich Felker <dalias@libc.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
Message-ID: <20200126071724.GA3520745@kroah.com>
References: <20200125195506.GA16638@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200125195506.GA16638@brightrain.aerifal.cx>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, Jan 25, 2020 at 02:55:06PM -0500, Rich Felker wrote:
> Signed-off-by: Rich Felker <dalias@libc.org>
> --

I know I don't accept patches without any changelog text, don't know
about other subsystem maintainers...

greg k-h
