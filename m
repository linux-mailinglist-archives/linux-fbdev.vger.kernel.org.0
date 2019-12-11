Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA30611A9AE
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Dec 2019 12:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbfLKLMC (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Dec 2019 06:12:02 -0500
Received: from mga17.intel.com ([192.55.52.151]:10820 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727493AbfLKLMB (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Dec 2019 06:12:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 03:12:01 -0800
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="207644152"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 03:11:57 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH v3 12/12] auxdisplay: constify fb ops
In-Reply-To: <CANiq72nPccKZghPM-FrNRnQ8AkN_r40cUmM3ruhyGtiTs_DdyQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com> <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com> <87pngx4muv.fsf@intel.com> <CANiq72nPccKZghPM-FrNRnQ8AkN_r40cUmM3ruhyGtiTs_DdyQ@mail.gmail.com>
Date:   Wed, 11 Dec 2019 13:11:54 +0200
Message-ID: <87wob32k1x.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 10 Dec 2019, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Dec 9, 2019 at 3:04 PM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
>> > Now that the fbops member of struct fb_info is const, we can start
>> > making the ops const as well.
>> >
>> > Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
>> > Cc: Robin van der Gracht <robin@protonic.nl>
>> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> > Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> > Acked-by: Robin van der Gracht <robin@protonic.nl>
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> Miguel, Robin, just to err on the safe side, were you both okay with me
>> merging this through drm-misc? Not very likely to conflict badly.
>
> I think that is fine, go ahead! :)

Thanks, pushed to drm-misc-next!

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
