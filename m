Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3CE14C076
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Jan 2020 19:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgA1S6Z (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 Jan 2020 13:58:25 -0500
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:53040 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgA1S6Z (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 Jan 2020 13:58:25 -0500
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
        id 1iwW43-0002pe-00; Tue, 28 Jan 2020 18:58:19 +0000
Date:   Tue, 28 Jan 2020 13:58:19 -0500
From:   Rich Felker <dalias@libc.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
Message-ID: <20200128185819.GG30412@brightrain.aerifal.cx>
References: <20200125195506.GA16638@brightrain.aerifal.cx>
 <1466259e-efe7-df52-c05b-80042628d577@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466259e-efe7-df52-c05b-80042628d577@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jan 27, 2020 at 08:36:07AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.01.20 um 20:55 schrieb Rich Felker:
> > Signed-off-by: Rich Felker <dalias@libc.org>
> > --
> > I've had this lying around a while and figure I should send it
> > upsteam; it's needed to support the onboard video on my Spectre-free
> > Atom S1260 server board.
> 
> This HW is supported by mgag200, which is maintained. Can't you use that?

Perhaps; I wasn't aware it existed. I'll give it a try. It still might
be nice to apply my patch though since the matroxfb driver works with
it and only fails to support it because of not knowing the device id.

Rich
