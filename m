Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDDC8184848
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Mar 2020 14:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgCMNiJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 13 Mar 2020 09:38:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48402 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgCMNiI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 13 Mar 2020 09:38:08 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 280965F;
        Fri, 13 Mar 2020 14:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584106687;
        bh=UBN5Umy01Tm7Cv8bTD62fblJWwI6SoHXtxhg5W5LvNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=smtnXpubTKQashwIDR5/CTWgxM8e1l3xFLtYBsnKRFJS52Z+kc0763HiWcTlAku3+
         YUalUcrECEQ2RweOJGfgxKzcRsCa68N16V4A1jFtLrmkWcFEpofEspE3wRRRLADXNz
         jwR9YaSYke7miywLZ/00yQkLFOTrVO/Y4+idHEPo=
Date:   Fri, 13 Mar 2020 15:38:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] omapfb: Remove unused writeback code
Message-ID: <20200313133803.GA9070@pendragon.ideasonboard.com>
References: <20200313122410.7528-1-tomi.valkeinen@ti.com>
 <20200313132244.GB4751@pendragon.ideasonboard.com>
 <249364fc-bc83-6fe6-d3bf-f709505c299e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <249364fc-bc83-6fe6-d3bf-f709505c299e@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Tomi,

On Fri, Mar 13, 2020 at 03:30:15PM +0200, Tomi Valkeinen wrote:
> On 13/03/2020 15:22, Laurent Pinchart wrote:
> > On Fri, Mar 13, 2020 at 02:24:10PM +0200, Tomi Valkeinen wrote:
> >> Remove unused writeback code. This code will never be used, as omapfb is
> >> being deprecated.
> > 
> > I'm fine with that, but out of curiosity, is there any particular reason
> > to remove that code now instead of letting omapfb bitrot slowly ?
> 
> It conflicts with tidss's writeback code in TI kernel, when compiling tidss and omapfb into the 
> kernel. I thought this is the easiest way to resolve that, as all the removed code is dead code, 
> instead of trying to invent new names in tidss for a lot of functions.
>
> Probably the functions in tidss still could use some renaming in the future, but I didn't want to be 
> forced to do that because of omapfb's dead code...

Could you do both ? :-) It's not good using too generic names in tidss.
You can just prefix the functions with tidss_. There's a risk of
conflict with omapdrm too if the names are too generic.

> So, not a super good reason, but on the other hand, removing dead code is always a good thing.

-- 
Regards,

Laurent Pinchart
