Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F77010DA95
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 21:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfK2UaM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 15:30:12 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38157 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbfK2UaM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 15:30:12 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so3549188wmi.3
        for <linux-fbdev@vger.kernel.org>; Fri, 29 Nov 2019 12:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xsYT5lMEF+x8inV5EK6Q/hgm20RbjUJUPe9EzYmEaa0=;
        b=lpBVcQxlQWKQlwPnqQn+b4vO/UTKXtp4LuAdhVs1O7y9n6TPwmgND034kKipTpduKr
         7EPSb7daq9j0RmY33ikvf/DWB6DVm6b9To9GctfErQ2TswXvS9imMT1y3BbUJgC4hMaK
         qCcYEf3t0ATUTHdniddf8RMFrzALNO4VE0ZqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xsYT5lMEF+x8inV5EK6Q/hgm20RbjUJUPe9EzYmEaa0=;
        b=cmWqKMPeLLbulAByCJCmbuiFS43S+beF/7VARIIGeFgLtVrHNOe7p8t6H4blcGzW/6
         nO8QJapPHF/UqpW8XOhua1lpJ8HZ/06N/7DujuGfHFgYvqrupR1JPDffhVc72MelpjJm
         ZvJiqwGrVkxN8aI+W7fGOlUKKpostTAi7ArCx4SZ96quGGP3oiK5G9k1QU5WbCH2RuVm
         zwUtXbGovsFH48e0rSYBSdvRvXDxAEMbWZbbZM9+dld0W36M9CtgzcaMUd+IyzA1xI9m
         61DicgFhW4Cd/XTFGJHPxp1Mm+xEBGkmzqM/j6TTAay+V6G89TM4LEt8rZHcVwU5kPoU
         WPIQ==
X-Gm-Message-State: APjAAAW900QTymymr2qxWTTBTO+z1BSOO+SxiYvPxjzavTKrmKcEE7Bv
        1/ibCc4rAg0x/zhMMKAJyf4iIg==
X-Google-Smtp-Source: APXvYqzJOztkRm1kwVy9FHEMusVGRjzr9oBrfa/YqQaHG3axAj84vRsSqbnDq+ajtpY9cXXMq9Ay7g==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr16709271wma.38.1575059410403;
        Fri, 29 Nov 2019 12:30:10 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id s19sm10360892wmc.4.2019.11.29.12.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 12:30:09 -0800 (PST)
Date:   Fri, 29 Nov 2019 21:30:07 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
Message-ID: <20191129203007.GV624164@phenom.ffwll.local>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
 <20191129152424.GG624164@phenom.ffwll.local>
 <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Nov 29, 2019 at 09:16:42PM +0100, Miguel Ojeda wrote:
> On Fri, Nov 29, 2019 at 4:24 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Oh, another display subsystem? Intriguing ...
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> It is intended for displays that are not intended as the usual/main
> display, e.g. very small LCDs :)

Well we do have very small lcd display drivers in drm, and before that in
fbdev. And you have a fbdev framebuffer driver in there, which looks a bit
misplaced ...

Afaiui you also have some even tinier lcd drivers where you don't address
pixels, but just directly upload text, and those obviously don't fit into
drm/fbdev world. But anything where you can address pixels very much does.
-Daniel

> 
> Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> 
> Cheers,
> Miguel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
