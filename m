Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC2B639BC
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jul 2019 18:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfGIQ6N (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Jul 2019 12:58:13 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45824 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfGIQ6N (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 9 Jul 2019 12:58:13 -0400
Received: by mail-io1-f68.google.com with SMTP id g20so23563040ioc.12;
        Tue, 09 Jul 2019 09:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=90nKBwxJQfOO8f1bbVdhzZRUgzRJZ25Z+zIv0ysWNrA=;
        b=N9ngUUlnEvHdII2a4r71xjPBCmL58+U7HLq01w0JcVwLDEZ44ZN7s1k4Wfm2e3pHcY
         Ac8JgNTVkOY3ey+WwtyZldeDCWDb2y2Kc2sw3l40aFYNy4Rgs3GVV4uxmB36bvftD9J6
         TQTuzRvMqM1G3BL8NW+ml7TFp21pLiBZZNzBuqgVZL6kb1cY9z381Vz1XJKyiDKLWDfx
         52YWq+OedGLKo8iEXgZybj2XNonPoV107uDfjWO4uG+7sqBIvchCTiaKlkdt0v+CN50e
         RQUnaGOn8ew6/Muls25KaP1PmmGCT+jhTXfnXmdu7lmzdIyXK7jWJGRBiMRTGIGoXd14
         oMgw==
X-Gm-Message-State: APjAAAW/7tbRFmE6Q6kFZ2gLcwniuwAC0vRcYVHKRnmyYBV3NNZT6Vsz
        igJAFf7i4s1t5NuFOY7q6w==
X-Google-Smtp-Source: APXvYqyzqY3fUqgHOKs5xetSi+syYPXpwYIQobtQET9nlWhHXWw2xMA2YyTM5BzJRhVfTcO9zAYeGA==
X-Received: by 2002:a5e:d80d:: with SMTP id l13mr7589708iok.292.1562691492115;
        Tue, 09 Jul 2019 09:58:12 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id e188sm18470483ioa.3.2019.07.09.09.58.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:58:11 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:58:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marko Kohtala <marko.kohtala@okoko.fi>
Cc:     linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Marko Kohtala <marko.kohtala@okoko.fi>
Subject: Re: [PATCH 5/6] dt-bindings: display: ssd1307fb: Add initialization
 properties
Message-ID: <20190709165809.GA5401@bogus>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
 <20190618074111.9309-6-marko.kohtala@okoko.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618074111.9309-6-marko.kohtala@okoko.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 18 Jun 2019 10:41:10 +0300, Marko Kohtala wrote:
> Document new bindings for adapting ssd1307fb driver to new displays.
> 
> Signed-off-by: Marko Kohtala <marko.kohtala@okoko.fi>
> ---
>  .../devicetree/bindings/display/ssd1307fb.txt          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
